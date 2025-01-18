#!/bin/sh -e

while :; do
	lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS
	printf "\nDisk (e.g. /dev/sda): " && read -r my_disk
	[ -b "$my_disk" ] && break
done

case "$my_disk" in
*"nvme"*)
	part1="$my_disk"p1
	part2="$my_disk"p2
	;;
*)
	part1="$my_disk"1
	part2="$my_disk"2
	;;
esac

cryptsetup open "$part2" root
mkdir -p /mnt
mount -o compress=zstd,subvol=root /dev/mapper/root /mnt
mount -o compress=zstd,subvol=home /dev/mapper/root /mnt/home
mount -o compress=zstd,noatime,subvol=nix /dev/mapper/root /mnt/nix
mount -o noatime,nodatacow,subvol=swap /dev/mapper/root /mnt/swap
mount -o umask=0077 "$part1" /mnt/boot
