#!/bin/sh

sha512sum -c stage3-amd64-desktop-systemd-*.tar.xz.DIGESTS
gpg --auto-key-retrieve --keyserver hkps://keys.gentoo.org --verify stage3-amd64-desktop-systemd-*.tar.xz.asc
