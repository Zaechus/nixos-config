{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "FiraCode Nerd Font";
        size = 11.0;
      };

      cursor.style = {
        shape = "Block";
      };

      colors = {
        primary = {
          background = config.theme.bg;
          foreground = config.theme.fg;
        };

        normal = with config.theme; {
          inherit black red green yellow blue magenta cyan white;
        };

        bright = with config.theme.bright; {
          inherit black red green yellow blue magenta cyan white;
        };
      };

      window.opacity = 0.9;
    };
  };

  wayland.windowManager.sway.config.terminal = "alacritty msg create-window || alacritty";
}
