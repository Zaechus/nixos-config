# https://github.com/folke/tokyonight.nvim
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  theme = {
    bg = "#24283b";
    fg = "#c0caf5";

    black = "#1D202F";
    red = "#f7768e";
    green = "#9ece6a";
    yellow = "#e0af68";
    blue = "#7aa2f7";
    magenta = "#bb9af7";
    cyan = "#7dcfff";
    white = "#a9b1d6";

    bright = {
      black = "#414868";
      white = "#c0caf5";
    };

    color = "#475fc4"; # blue
    colorFg = config.theme.blue;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim lualine-nvim
    ];

    extraConfig = ''
      colorscheme tokyonight
      lua << END
      require('lualine').setup()
      END
    '';
  };

  programs.alacritty.settings = {
    colors.indexed_colors = [
      { index = 16; color = "#ff9e64"; }
      { index = 17; color = "#db4b4b"; }
    ];
    background_opacity = 0.9;
  };

  #programs.chromium.extensions = [ "enpfonmmpgoinjpglildebkaphbhndek" ];
}
