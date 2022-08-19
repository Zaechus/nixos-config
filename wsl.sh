#!/bin/sh -e

mkdir -p ~/.config/nix
sed -i "/^experimental-features.*/d" ~/.config/nix/nix.conf
sh -c 'printf "experimental-features = nix-command flakes\n" >> ~/.config/nix/nix.conf'

nix build --no-link ".#homeConfigurations.wsl.activationPackage"
"$(nix path-info .\#homeConfigurations.wsl.activationPackage)"/activate

home-manager switch --flake ".#wsl"
