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
          black = config.theme.blackBright;
          red = config.theme.redBright;
          green = config.theme.greenBright;
          yellow = config.theme.yellowBright;
          blue = config.theme.blueBright;
          magenta = config.theme.magentaBright;
          cyan = config.theme.cyanBright;
          white = config.theme.whiteBright;
        };
      };

      #window = {
      #  opacity = 0.8;
      #};
      background_opacity = 0.8;
    };
  };
}
