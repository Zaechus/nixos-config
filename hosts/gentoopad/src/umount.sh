#!/bin/sh

umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
swapoff /dev/mapper/swap
cryptsetup close /dev/mapper/swap
cryptsetup close /dev/mapper/root
