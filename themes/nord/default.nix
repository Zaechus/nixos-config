# https://github.com/arcticicestudio/nord
# https://www.nordtheme.com/docs/colors-and-palettes
# https://github.com/arcticicestudio/nord-alacritty/blob/develop/src/nord.yml

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    bg = "#2E3440"; # nord0
    fg = "#D8DEE9"; # nord4

    black = "#3B4252"; # nord1
    red = "#BF616A"; # nord11
    green = "#A3BE8C"; # nord14
    yellow = "#EBCB8B"; # nord13
    blue = "#81A1C1"; # nord9
    magenta = "#B48EAD"; # nord15
    cyan = "#88C0D0"; # nord8
    white = "#E5E9F0"; # nord5

    bright = {
      black = "#4C566A"; # nord3
      red = config.theme.red;
      green = config.theme.green;
      yellow = config.theme.yellow;
      blue = config.theme.blue;
      magenta = config.theme.magenta;
      cyan = "#8FBCBB"; # nord7
      white = "#ECEFF4"; # nord6
    };

    color = "#5E81AC"; # nord10
    colorFg = config.theme.cyan;
  };

  # https://github.com/shaunsingh/nord.nvim/
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nord-nvim ];

    extraConfig = ''
      colorscheme nord
      lua << END
    '' +
    builtins.readFile ../../modules/neovim/setup.lua +
    ''
      END'';
  };

  programs.bat.config.theme = "Nord";

  programs.bottom.settings.flags.color = "nord";

  gtk = {
    iconTheme = {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };

  programs.i3status-rust.bars.top.settings.theme = {
    name = "nord-dark";
    overrides.separator = "<span font='13.5'></span>";
  };

  programs.chromium.extensions = [ "abehfkkfjlplnjadfcjiflnejblfmmpj" ];

  programs.tmux.plugins = with pkgs.tmuxPlugins; [ nord ];

  programs.helix.settings.theme = "nord";

  programs.zellij.settings = {
    theme = "nord";

    # https://github.com/zellij-org/zellij/blob/main/example/themes/nord.yaml
    themes.nord = {
      fg = [ 216 222 233 ]; #D8DEE9
      bg = [ 46 52 64 ]; #2E3440
      black = [ 59 66 82 ]; #3B4252
      red = [ 191 97 106 ]; #BF616A
      green = [ 163 190 140 ]; #A3BE8C
      yellow = [ 235 203 139 ]; #EBCB8B
      blue = [ 129 161 193 ]; #81A1C1
      magenta = [ 180 142 173 ]; #B48EAD
      cyan = [ 136 192 208 ]; #88C0D0
      white = [ 229 233 240 ]; #E5E9F0
      orange = [ 208 135 112 ]; #D08770
    };
  };

  nu.LS_COLORS = "let-env LS_COLORS = (vivid generate nord | str trim)\n";
}
