# https://github.com/savq/melange
# https://github.com/savq/melange/blob/master/term/alacritty/melange_dark.yml

{ config, pkgs, ... }:

{
  imports = [ ./theme.nix ];

  theme = {
    fg = "#ECE1D7";
    bg = "#2A2520";

    black = "#352F2A";
    red = "#B65C60";
    green = "#78997A";
    yellow = "#EBC06D";
    blue = "#9AACCE";
    magenta = "#B380B0";
    cyan = "#86A3A3";
    white = "#A38D78";

    bright = {
      black = "#4D453E";
      red = "#F17C64";
      green = "#99D59D";
      yellow = "#EBC06D";
      blue = "#9AACCE";
      magenta = "#CE9BCB";
      cyan = "#88B3B2";
      white = "#C1A78E";
    };

    color = config.theme.blue;
    colorFg = config.theme.blue;
  };

  #programs.neovim = {
  #  plugins = with pkgs.vimPlugins; [
  #    melange
  #  ];

  #  extraConfig = ''
  #    colorscheme melange
  #  '';
  #};

  #programs.alacritty.settings.background_opacity = 0.8;
}
