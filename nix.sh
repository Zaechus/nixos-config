#!/bin/sh -e

nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-shell '<home-manager>' -A install

script_path=$(dirname $(realpath $0))

ln -sf $script_path/hosts/$1/home.nix ~/.config/nixpkgs/home.nix
home-manager switch --flake ".#$1"
