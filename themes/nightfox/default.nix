# https://github.com/EdenEast/nightfox.nvim
# https://github.com/EdenEast/nightfox.nvim/blob/main/extra/nightfox/nightfox_alacritty.yml

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    fg = "#cdcecf";
    bg = "#192330";

    black = "#393b44";
    red = "#c94f6d";
    green = "#81b29a";
    yellow = "#dbc074";
    blue = "#719cd6";
    magenta = "#9d79d6";
    cyan = "#63cdcf";
    white = "#dfdfe0";

    bright = {
      black = "#575860";
      red = "#d16983";
      green = "#8ebaa4";
      yellow = "#e0c989";
      blue = "#86abdc";
      magenta = "#baa1e2";
      cyan = "#7ad4d6";
      white = "#e4e4e5";
    };

    color = "#4f7ab4"; # blue
    colorFg = config.theme.blue;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nightfox-nvim
      lualine-nvim
    ];

    extraConfig = ''
      colorscheme nightfox
      lua << END
      require('lualine').setup()
      END
    '';
  };

  programs.alacritty.settings.colors.indexed_colors = [
    { index = 16; color = "#f4a261"; }
    { index = 17; color = "#d67ad2"; }
  ];
}
