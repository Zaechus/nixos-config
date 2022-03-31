{ config, pkgs, ... }:

{
  imports = [
    ../modules/neovim
    ../modules/zsh
  ];

  programs.git.enable = true;
}
