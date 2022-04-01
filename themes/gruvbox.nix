# https://github.com/morhetz/gruvbox

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      gruvbox
    ];

    extraConfig = ''
      colorscheme gruvbox
      let g:lightline = {'colorscheme': 'gruvbox'}
    '';
  };
}
