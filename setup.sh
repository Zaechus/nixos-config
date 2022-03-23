#!/bin/sh -e

script_path=$(dirname $(realpath $0))

config_path=$(ls $script_path/hosts/$1/configuration.nix)

sed -i "/\/etc\/nixos\/swap-configuration.nix/ s~$~ $config_path~" /etc/nixos/configuration.nix
nixos-rebuild --switch
