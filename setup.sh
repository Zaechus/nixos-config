#!/bin/sh -e

script_path=$(dirname $(realpath $0))

ln -sf $script_path/configuration.nix /etc/nixos/configuration.nix
chown root:root $script_path/configuration.nix
