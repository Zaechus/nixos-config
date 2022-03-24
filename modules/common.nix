{ config, pkgs, ... }:

{
  imports =
    [
      ./alacritty.nix
      ./git.nix
      ./sway/default.nix
      ./zsh.nix
    ];
}
