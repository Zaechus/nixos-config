{ config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
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

      font = {
        normal = {
          family = "Iosevka Extended";
          style = "Term";
        };
        size = 10.0;
      };

      # window.opacity = 0.9;
    };
  };

  wayland.windowManager.sway.config.terminal = "alacritty msg create-window || alacritty";

  home.shellAliases.peek = "alacritty msg config window.opacity=0.9";
}
