#!/bin/sh -e

source /etc/profile

my_hostname=gentoopad
my_timezone=America/Denver

if [[ $my_disk == *"nvme"* ]]; then
    part1="$my_disk"p1
    part2="$my_disk"p2
    part3="$my_disk"p3
else
    part1="$my_disk"1
    part2="$my_disk"2
    part3="$my_disk"3
fi

uuid1=$(blkid $part1 -o value -s UUID)
uuid2=$(blkid $part2 -o value -s UUID)
uuid3=$(blkid $part3 -o value -s UUID)

# Configure Portage
emerge-webrsync
eselect news read
eselect profile set $(eselect profile list | grep desktop/systemd | awk -F'[^0-9]*' '{ print $2 }')
printf "sys-apps/systemd gnuefi\n" > /etc/portage/package.use/systemd
printf "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE\n" > /etc/portage/package.license
emerge -quDN @world

# Timezone
ln -sf /usr/share/zoneinfo/$my_timezone /etc/localtime

# Locales
printf "en_US.UTF-8 UTF-8\n" > /etc/locale.gen
locale-gen
eselect locale set $(eselect locale list | grep en_US | awk -F'[^0-9]*' '{ print $2 }')
env-update && source /etc/profile

# Firmware and microcode
emerge -qn sys-kernel/linux-firmware
[[ $(grep 'vendor' /proc/cpuinfo) == *"Intel"* ]] && emerge -qn sys-firmware/intel-microcode

# Kernel
emerge -qn sys-kernel/gentoo-sources
eselect kernel set 1
cd /usr/src/linux
make menuconfig
make -j$(nproc) && make modules_install && make install
cd /

# Initramfs
emerge -qn sys-kernel/dracut
kver=$(uname -r | sed "s/-.*$//g")-gentoo
dracut --zstd --kver $kver -f

# Filesystem configuration
emerge -qn sys-fs/cryptsetup sys-fs/btrfs-progs
printf "/dev/mapper/luks-$uuid3\t/\tbtrfs\tcompress=zstd,subvol=root\t0 0\nUUID=$uuid1\t\t\t\t\t\t/boot\tvfat\tdefaults\t0 2\n/dev/mapper/luks-$uuid3\t/home\tbtrfs\tcompress=zstd,subvol=home\t0 0\n/dev/mapper/luks-$uuid2\tnone\tswap\tsw\t0 0\n" > /etc/fstab

# Host
echo $my_hostname > /etc/hostname
printf "127.0.0.1\t$my_hostname.localdomain\t$my_hostname\tlocalhost\n::1\t\tlocalhost\n" > /etc/hosts

# Network
printf "[Match]\nName=enp*\n\n[Network]\nDHCP=yes\n\n[DHCPv4]\nRouteMetric=10\n\n[IPv6AcceptRA]\nRouteMetric=10\n" > /etc/systemd/network/10-wired.network
printf "[Match]\nName=wl*\n\n[Network]\nDHCP=yes\n\n[DHCPv4]\nRouteMetric=20\n\n[IPv6AcceptRA]\nRouteMetric=20\n" > /etc/systemd/network/20-wireless.network
systemctl enable systemd-networkd.service

emerge -qn net-wireless/iwd
systemctl enable iwd.service

# Boot loader
bootctl --make-machine-id-directory=no install
printf "timeout 1\ndefault gentoo\n" > /boot/loader/loader.conf
printf "title Gentoo Linux\nlinux /vmlinuz-$kver\ninitrd /initramfs-$kver.img\noptions luks.uuid=$uuid3 luks.uuid=$uuid2 root=/dev/mapper/luks-$uuid3 rootfstype=btrfs rootflags=compress=zstd,subvol=root\n" > /boot/loader/entries/gentoo.conf

# Root passwd
passwd
