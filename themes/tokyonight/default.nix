# https://github.com/folke/tokyonight.nvim
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml

{ config, pkgs, ... }:

{
  imports = [ ../theme.nix ];

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
    plugins = with pkgs.vimPlugins; [ tokyonight-nvim ];

    extraConfig = ''
      colorscheme tokyonight
      lua << END
    '' +
    builtins.readFile ../../modules/neovim/setup.lua +
    ''
      END'';
  };

  programs.alacritty.settings.colors.indexed_colors = [
    { index = 16; color = "#ff9e64"; }
    { index = 17; color = "#db4b4b"; }
  ];

  programs.i3status-rust.bars.top.settings.theme = {
    theme = "modern";
    overrides.idle_bg = config.theme.bg;
  };

  #programs.chromium.extensions = [ "enpfonmmpgoinjpglildebkaphbhndek" ];

  # https://github.com/folke/tokyonight.nvim/blob/main/extras/tmux_tokyonight_storm.tmux
  programs.tmux.extraConfig = builtins.readFile ./tmux_tokyonight_storm.tmux;

  programs.helix.settings.theme = "tokyonight_storm";

  programs.zellij.settings = {
    theme = "tokyonight-storm";

    # https://github.com/zellij-org/zellij/blob/main/example/themes/tokyo-night-storm.yaml
    themes.tokyonight-storm = {
      fg = [ 169 177 214 ]; #A9B1D6
      bg = [ 36 40 59 ]; #24283B
      black = [ 56 62 90 ]; #383E5A
      red = [ 249 51 87 ]; #F9334D
      green = [ 158 206 106 ]; #9ECE6A
      yellow = [ 224 175 104 ]; #E0AF68
      blue = [ 122 162 247 ]; #7AA2F7
      magenta = [ 187 154 247 ]; #BB9AF7
      cyan = [ 42 195 222 ]; #2AC3DE
      white = [ 192 202 245 ]; #C0CAF5
      orange = [ 255 158 100 ]; #FF9E64
    };
  };
}
