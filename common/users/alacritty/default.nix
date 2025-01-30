{ username, ... }: { config, ... }:

{
  users.users.${username} = {
    programs.alacritty = {
      enable = true;
      settings = {
        cursor.style.shape = "Block";
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
      };
    };

    programs.sway.config.terminal = "alacritty msg create-window || alacritty";
  };
}
