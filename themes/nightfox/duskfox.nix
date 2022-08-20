# https://github.com/EdenEast/nightfox.nvim
# https://github.com/EdenEast/nightfox.nvim/blob/main/extra/duskfox/nightfox_alacritty.yml

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    fg = "#e0def4";
    bg = "#232136";

    black = "#393552";
    red = "#eb6f92";
    green = "#a3be8c";
    yellow = "#f6c177";
    blue = "#569fba";
    magenta = "#c4a7e7";
    cyan = "#9ccfd8";
    white = "#e0def4";

    bright = {
      black = "#47407d";
      red = "#f083a2";
      green = "#b1d196";
      yellow = "#f9cb8c";
      blue = "#65b1cd";
      magenta = "#ccb1ed";
      cyan = "#a6dae3";
      white = "#e2e0f7";
    };

    color = "#8063a3"; # purple
    colorFg = config.theme.magenta;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nightfox-nvim
      lualine-nvim
    ];

    extraConfig = ''
      colorscheme duskfox
      lua << END
      require('lualine').setup()
      END
    '';
  };

  programs.alacritty.settings.colors.indexed_colors = [
    { index = 16; color = "0xea9a97"; }
    { index = 17; color = "0xeb98c3"; }
  ];
}
