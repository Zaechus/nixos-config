# https://github.com/arcticicestudio/nord

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  theme = {};

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nord-vim
    ];

    extraConfig = ''
      colorscheme nord
      let g:lightline = {'colorscheme': 'nord'}
    '';
  };

}
