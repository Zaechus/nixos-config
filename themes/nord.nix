# https://github.com/arcticicestudio/nord
# https://www.nordtheme.com/docs/colors-and-palettes
# https://github.com/arcticicestudio/nord-alacritty/blob/develop/src/nord.yml

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  theme = {
    bg = "#2E3440"; # nord0
    fg = "#D8DEE9"; # nord4

    black = "#3B4252"; # nord1
    red = "#BF616A"; # nord11
    green = "#A3BE8C"; # nord14
    yellow = "#EBCB8B"; # nord13
    blue = "#81A1C1"; # nord9
    magenta = "#B48EAD"; # nord15
    cyan = "#8FBCBB"; # nord7
    white = "#E5E9F0"; # nord5

    bright = {
      black = "#434C5E"; # nord3
      red = "#D08770"; # nord12
      green = config.theme.green;
      yellow = config.theme.yellow;
      blue = "#5E81AC"; # nord10
      magenta = config.theme.magenta;
      cyan = "#88C0D0"; # nord8
      white = "#ECEFF4"; # nord6
    };

    gray = "#4C566A"; # nord3
    color = config.theme.bright.blue;
    colorFg = config.theme.bright.cyan;
  };

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
