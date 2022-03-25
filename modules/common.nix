{ config, pkgs, ... }:

{
  imports =
    [
      ./alacritty.nix
      ./git.nix
      ./neovim.nix
      ./sway/default.nix
      ./zsh.nix
    ];
}
