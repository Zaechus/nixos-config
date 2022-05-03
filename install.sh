#!/bin/sh -e

confirm_password () {
    while :; do
        printf "$1: " >&2 && read -rs pass1 && printf "\n" >&2
        printf "confirm $1: " >&2 && read -rs pass2 && printf "\n" >&2
        [[ $pass1 == $pass2 && $pass2 ]] && break
    done
    echo $pass2
}

# Choose disk
while :; do
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS
    printf "\nDisk (e.g. /dev/sda): " && read my_disk
    [[ -b $my_disk ]] && break
done

cryptpass=$(confirm_password "encryption password")

if [[ $my_disk == *"nvme"* ]]; then
    part1="$my_disk"p1
    part2="$my_disk"p2
else
    part1="$my_disk"1
    part2="$my_disk"2
fi

# Partition
printf "label: gpt\n,550M,U\n,,L\n" | sfdisk $my_disk

# Encrypt
yes $cryptpass | cryptsetup -q luksFormat $part2
yes $cryptpass | cryptsetup open $part2 root

# Format
mkfs.fat -F 32 $part1

mkfs.btrfs /dev/mapper/root
mkdir -p /mnt
mount /dev/mapper/root /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/swap
umount /mnt

# Mount
mount -o compress=zstd,subvol=root              /dev/mapper/root /mnt
mkdir /mnt/{home,nix,swap}
mount -o compress=zstd,subvol=home              /dev/mapper/root /mnt/home
mount -o noatime,compress=zstd,subvol=nix       /dev/mapper/root /mnt/nix
mount -o noatime,subvol=swap                    /dev/mapper/root /mnt/swap

mkdir /mnt/boot
mount $part1 /mnt/boot

# Swapfile
truncate -s 0 /mnt/swap/swapfile
chattr +C /mnt/swap/swapfile
btrfs property set /mnt/swap/swapfile compression none
fallocate -l 4G /mnt/swap/swapfile
chmod 0600 /mnt/swap/swapfile
mkswap /mnt/swap/swapfile

# NixOS
nixos-generate-config --root /mnt

nixos-install
