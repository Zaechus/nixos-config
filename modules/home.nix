{ config, pkgs, ... }:

{
  imports = [
    ../themes/tokyonight.nix
    ./neovim
    ./zsh
  ];

  programs.git.enable = true;
}
