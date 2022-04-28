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

  programs.alacritty.settings.background_opacity = 0.9;

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
}
