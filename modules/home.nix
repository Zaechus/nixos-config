{ config, pkgs, ... }:

{
  imports = [
    ../themes/theme.nix
    ./neovim
    ./zsh
  ];

  programs.git.enable = true;
}
