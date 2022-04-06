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

    color = config.theme.cyan; # green
    colorFg = config.theme.green;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      everforest lightline-vim
    ];

    extraConfig = ''
      let g:everforest_background = 'medium'
      colorscheme everforest
      let g:lightline = {'colorscheme': 'everforest'}
    '';
  };

  #programs.alacritty.settings.background_opacity = 0.8;
}
