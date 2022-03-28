#!/bin/sh -e

# Cron
emerge -qn sys-process/cronie
systemctl enable cronie

# Daily user
emerge -qn app-admin/sudo app-shells/zsh app-shells/zsh-completions app-shells/gentoo-zsh-completions
sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
useradd -m -G users,wheel,audio,video,portage,systemd-journal -s /bin/zsh zaechus
passwd zaechus
