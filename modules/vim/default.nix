{ pkgs, lib, ... }:

{
  programs.neovim.vimAlias = lib.mkOverride 1 false;
  programs.vim = {
    enable = true;

    extraConfig = builtins.readFile ./vimrc;
  };
}
