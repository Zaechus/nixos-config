#!/bin/sh -e

ln -sf ~/.nixos-config/configuration.nix /etc/nixos/configuration.nix
ln -sf /etc/nixos/hardware-configuration.nix ~/.nixos-config/
