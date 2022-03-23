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
mkdir -p /mnt
mount /dev/mapper/root /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
umount /mnt

# Mount
mount -o compress=zstd,subvol=root /dev/mapper/root /mnt
mkdir /mnt/home
mount -o compress=zstd,subvol=home /dev/mapper/root /mnt/home

mkdir /mnt/boot
mount $part1 /mnt/boot

swapon /dev/mapper/swap

# NixOS
nixos-generate-config --root /mnt
printf "{ config, ... }: { boot.initrd.luks.devices.\"swap\".device = \"/dev/disk/by-uuid/$(blkid $part2 -o value -s UUID)\"; }\n" > /mnt/etc/nixos/swap-configuration.nix
sed -i '/\/etc\/nixos\/hardware-configuration.nix/ s/$/ \/etc\/nixos\/swap-configuration.nix/' /mnt/etc/nixos/configuration.nix

nixos-install
