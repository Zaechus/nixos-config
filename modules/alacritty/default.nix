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

      # https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml
      colors = {
        primary = {
          background = "0x24283b";
          foreground = "0xc0caf5";
        };

        normal = {
          black = "0x1D202F";
          red = "0xf7768e";
          green = "0x9ece6a";
          yellow = "0xe0af68";
          blue = "0x7aa2f7";
          magenta = "0xbb9af7";
          cyan = "0x7dcfff";
          white = "0xa9b1d6";
        };

        bright = {
          black = "0x414868";
          red = "0xf7768e";
          green = "0x9ece6a";
          yellow = "0xe0af68";
          blue = "0x7aa2f7";
          magenta = "0xbb9af7";
          cyan = "0x7dcfff";
          white = "0xc0caf5";
        };

        indexed_colors = [
          { index = 16; color = "0xff9e64"; }
          { index = 17; color = "0xdb4b4b"; }
        ];
      };

      #window = {
      #  opacity = 0.8;
      #};
      background_opacity = 0.8;
    };
  };
}
