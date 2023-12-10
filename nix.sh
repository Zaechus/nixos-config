#!/bin/sh

sudo sed -i "/^experimental-features.*/d" /etc/nix/nix.conf
sudo sh -c 'printf "experimental-features = nix-command flakes\n" >> /etc/nix/nix.conf'

nix run home-manager/master -- switch --flake ".#$1"
