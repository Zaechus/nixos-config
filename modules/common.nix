{ config, pkgs, ... }:

{
  imports =
    [
      ./alacritty.nix
      ./git.nix
      ./neovim/default.nix
      ./sway/default.nix
      ./zsh.nix
    ];
}
