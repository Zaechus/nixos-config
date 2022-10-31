# https://github.com/morhetz/gruvbox
# https://github.com/gruvbox-community/gruvbox
# https://camo.githubusercontent.com/410b3ab80570bcd5b470a08d84f93caa5b4962ccd994ebceeb3d1f78364c2120/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    bg = "#282828";
    fg = "#ebdbb2";

    black = "#3c3836"; # bg1
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286"; # purple
    cyan = "#689d6a"; # aqua
    white = "#d5c4a1"; # fg2

    bright = {
      black = "#504945"; # bg2
      red = "#fb4934";
      green = "#b8bb26";
      yellow = "#fabd2f";
      blue = "#83a598";
      magenta = "#d3869b"; # purple
      cyan = "#8ec07c"; # aqua
      white = "#fbf1c7"; # fg0
    };

    color = "#665c54"; # bg3
    colorFg = "#fe8019"; # orange 208
  };

  # https://github.com/ellisonleao/gruvbox.nvim
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ gruvbox-nvim ];

    extraConfig = ''
      colorscheme gruvbox
      hi Normal guibg=${config.theme.bg}
      lua << EOF
    '' +
    builtins.readFile ../../modules/neovim/setup.lua +
    ''
      EOF'';
  };

  programs.bat.config.theme = "gruvbox-dark";

  programs.git.delta.options.syntax-theme = "gruvbox-dark";

  programs.bottom.settings.flags.color = "gruvbox";

  programs.alacritty.settings.colors.indexed_colors = [
    { index = 16; color = "#ff9e64"; }
    { index = 17; color = "#db4b4b"; }
  ];

  gtk = {
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
  };

  programs.i3status-rust.bars.top.settings.theme = {
    name = "gruvbox-dark";
    overrides.separator = "<span font='13.5'></span>";
  };

  programs.chromium.extensions = [ "hmalklkailocblgkjpdagjoieifkdfbj" ];

  programs.tmux.plugins = with pkgs.tmuxPlugins; [ gruvbox ];

  programs.helix.settings.theme = "gruvbox";

  programs.zellij.settings = {
    theme = "gruvbox";

    # https://github.com/zellij-org/zellij/blob/main/example/themes/gruvbox-dark.yaml
    themes.gruvbox = {
      bg = [ 40 40 40 ];
      red = [ 204 36 29 ];
      green = [ 152 151 26 ];
      yellow = [ 215 153 33 ];
      blue = [ 69 133 136 ];
      magenta = [ 177 98 134 ];
      orange = [ 214 93 14 ];
      fg = [ 213 196 161 ];
      cyan = [ 104 157 106 ];
      black = [ 60 56 54 ];
      white = [ 251 241 199 ];
    };
  };

  home.packages = with pkgs; [ vivid ];
  nu.LS_COLORS = "gruvbox-dark";

  programs.micro.settings.colorscheme = "gruvbox";
}
