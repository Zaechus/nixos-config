#!/bin/sh -e

confirm_password () {
    while :
    do
        printf "$1: " >&2 && read -rs pass1 && printf "\n" >&2
        printf "confirm $1: " >&2 && read -rs pass2 && printf "\n" >&2
        [[ $pass1 == $pass2 && $pass2 ]] && break
    done
    echo $pass2
}

# Choose disk
while :
do
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS
    printf "\nDisk (e.g. /dev/sda): " && read my_disk
    [[ -b $my_disk ]] && break
done

cryptpass=$(confirm_password "encryption password")

if [[ $my_disk == *"nvme"* ]]; then
    part1="$my_disk"p1
    part2="$my_disk"p2
    part3="$my_disk"p3
else
    part1="$my_disk"1
    part2="$my_disk"2
    part3="$my_disk"3
fi

# Partition
printf "label: gpt\n,550M,U\n,4G,S\n,,L\n" | sfdisk $my_disk

# Encrypt
yes $cryptpass | cryptsetup -q luksFormat $part3
yes $cryptpass | cryptsetup -q luksFormat $part2
yes $cryptpass | cryptsetup open $part3 root
yes $cryptpass | cryptsetup open $part2 swap

# Format
mkfs.fat -F 32 $part1

mkswap /dev/mapper/swap

mkfs.btrfs /dev/mapper/root
mkdir -p /mnt/gentoo
mount /dev/mapper/root /mnt/gentoo
btrfs subvolume create /mnt/gentoo/root
btrfs subvolume create /mnt/gentoo/home
umount /mnt/gentoo

# Mount
mount -o compress=zstd,subvol=root /dev/mapper/root /mnt/gentoo
mkdir /mnt/gentoo/home
mount -o compress=zstd,subvol=home /dev/mapper/root /mnt/gentoo/home

mkdir /mnt/gentoo/boot
mount $part1 /mnt/gentoo/boot

swapon /dev/mapper/swap

# Stage 3
ntpd -q -g

cp iamchroot.sh /mnt/gentoo/
mv stage3-amd64-desktop-systemd-*.tar.xz /mnt/gentoo/

cd /mnt/gentoo
tar xpf stage3-amd64-desktop-systemd-*.tar.xz --xattrs-include='*.*' --numeric-owner

# make.conf
sed -i "s/COMMON_FLAGS=\".*\"/COMMON_FLAGS=\"-march=native -O2 -pipe\"/g" /mnt/gentoo/etc/portage/make.conf

jobs_mem=$(($(($(awk '/^Mem/ {print $2}' <(free --giga))+1))/2))
make_jobs=$(nproc)
(( $jobs_mem < $make_jobs )) && make_jobs=$jobs_mem
printf "\nMAKEOPTS=\"-j$make_jobs\"\n" >> /mnt/gentoo/etc/portage/make.conf
printf "RUSTFLAGS=\"-C target-cpu=native\"\n\n" >> /mnt/gentoo/etc/portage/make.conf 
printf "INPUT_DEVICES=\"libinput\"\n\n" >> /mnt/gentoo/etc/portage/make.conf 
printf "ACCEPT_LICENSE=\"-* @FREE\"\n\n" >> /mnt/gentoo/etc/portage/make.conf 

# Mirrors
mirrorselect -D -s3 -o >> /mnt/gentoo/etc/portage/make.conf
mkdir -p /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp -L /etc/resolv.conf /mnt/gentoo/etc/

# USE
printf "USE=\"-bluetooth cryptsetup\"\n" >> /mnt/gentoo/etc/portage/make.conf

# Chroot
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

my_disk=$my_disk chroot /mnt/gentoo /bin/bash -c 'sh /iamchroot.sh; rm /iamchroot.sh'
./umount.sh
