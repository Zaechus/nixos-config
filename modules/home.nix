{ config, pkgs, ... }:

{
  imports = [
    ../modules/neovim
    ../modules/zsh
  ];
}
