# https://github.com/sainnhe/everforest
# https://gist.github.com/sainnhe/6432f83181c4520ea87b5211fed27950

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    fg = "#d3c6aa";
    bg = "#2f383e";

    black = "#4b565c";
    red = "#e67e80";
    green = "#a7c080";
    yellow = "#dbbc7f";
    blue = "#7fbbb3";
    magenta = "#d699b6";
    cyan = "#83c092";
    white = "#d3c6aa";

    color = "#508759"; # green
    colorFg = config.theme.cyan;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ everforest ];

    extraConfig = ''
      let g:everforest_background = 'medium'
      colorscheme everforest
      lua << EOF
      '' +
      builtins.readFile ../../modules/neovim/setup.lua +
      ''
    EOF'';
  };

  programs.alacritty.settings.background_opacity = 0.9;
}
