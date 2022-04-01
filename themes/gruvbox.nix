# https://github.com/morhetz/gruvbox
# https://camo.githubusercontent.com/410b3ab80570bcd5b470a08d84f93caa5b4962ccd994ebceeb3d1f78364c2120/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  theme = {
    bg = "#262626"; # bg - 2
    fg = "#ebdbb2";

    black = "#3c3836"; # bg1
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286"; # purple
    cyan = "#689d6a"; # aqua
    white = "#d5c4a1"; # fg2

    bright = {
      black = "#504945"; # bg2
      red = "#fb4934";
      green = "#b8bb26";
      yellow = "#fabd2f";
      blue = "#83a598";
      magenta = "#d3869b"; # purple
      cyan = "#8ec07c"; # aqua
      white = "#fbf1c7"; # fg0
    };

    color = "#504945"; # bg2
    colorFg = "#a89984"; # fg4
  };

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