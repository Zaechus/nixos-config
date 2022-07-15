#!/bin/sh -e

script_path=$(dirname $(realpath $0))

ln -sf $script_path/flake.nix /etc/nixos/flake.nix
nixos-rebuild switch --flake ".#$1"
