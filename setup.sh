#!/bin/sh -e

script_path=$(dirname $(realpath $0))

config_path=$(ls $script_path/hosts/$1/configuration.nix)

ln -sf $config_path /etc/nixos/configuration.nix
nixos-rebuild switch
