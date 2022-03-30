#!/bin/sh -e

sh <(curl -L https://nixos.org/nix/install) --daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-shell '<home-manager>' -A install

script_path=$(dirname $(realpath $0))
config_path=$(ls $script_path/hosts/$1/home.nix)
ln -sf $config_path ~/.config/nixpkgs/home.nix
home-manager switch
