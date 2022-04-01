{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "FiraCode";
          #style = "Retina";
          size = 11.0;
        };
      };

      colors = {
        primary = {
          background = config.theme.bg;
          foreground = config.theme.fg;
        };

        normal = {
          black = config.theme.black;
          red = config.theme.red;
          green = config.theme.green;
          yellow = config.theme.yellow;
          blue = config.theme.blue;
          magenta = config.theme.magenta;
          cyan = config.theme.cyan;
          white = config.theme.white;
        };

        bright = {
          black = config.theme.bright.black;
          red = config.theme.bright.red;
          green = config.theme.bright.green;
          yellow = config.theme.bright.yellow;
          blue = config.theme.bright.blue;
          magenta = config.theme.bright.magenta;
          cyan = config.theme.bright.cyan;
          white = config.theme.bright.white;
        };
      };

      #window = {
      #  opacity = 0.8;
      #};
    };
  };
}
