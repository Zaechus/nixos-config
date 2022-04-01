{ config, pkgs, ... }:

{
  imports = [
    ../themes/gruvbox.nix
    ./neovim
    ./zsh
  ];

  programs.git.enable = true;
}
