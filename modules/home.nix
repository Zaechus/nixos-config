{ config, pkgs, ... }:

{
  imports = [
    ./neovim
    ./zsh
  ];

  programs.git.enable = true;
}
