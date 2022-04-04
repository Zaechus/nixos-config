# https://github.com/sainnhe/sonokai
# https://gist.github.com/sainnhe/e5c4512d5bcfcb46afd493beb86223c6

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    fg = "#e2e2e3";
    bg = "#2c2e34";

    black = "#181819";
    red = "#fc5d7c";
    green = "#9ed072";
    yellow = "#e7c664";
    blue = "#76cce0";
    magenta = "#b39df3";
    cyan = "#f39660";
    white = "#e2e2e3";

    bright = {
      black = "#7f8490";
      red = "#fc5d7c";
      green = "#9ed072";
      yellow = "#e7c664";
      blue = "#76cce0";
      magenta = "#b39df3";
      cyan = "#f39660";
      white = "#e2e2e3";
    };

    color = "#eb4c6b"; # red
    colorFg = config.theme.red;
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      sonokai lualine-nvim
    ];

    extraConfig = ''
      colorscheme sonokai
      lua << END
      require('lualine').setup()
      END
    '';
  };

  programs.alacritty.settings.background_opacity = 0.9;
}
