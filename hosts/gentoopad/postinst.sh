#!/bin/sh -e

# Custom make.conf
cp configs/make.conf /etc/portage/make.conf
emerge -avuDN @world

# Cron
emerge -qn sys-process/cronie
systemctl enable cronie

# Daily user
emerge -qn app-admin/sudo app-shells/zsh app-shells/zsh-completions app-shells/gentoo-zsh-completions
sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
useradd -m -G users,wheel,audio,video,portage,systemd-journal -s /bin/zsh zaechus
passwd zaechus

# Packages
mkdir -p /etc/portage/package.accept_keywords/
mkdir -p /etc/portage/package.use/
echo dev-libs/bemenu > /etc/portage/package.accept_keywords/bemenu
emerge -qn gui-wm/sway app-misc/neofetch x11-terms/alacritty dev-libs/bemenu app-editors/neovim
