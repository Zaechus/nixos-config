# https://github.com/dracula
# https://spec.draculatheme.com/

{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  theme = {
    bg = "#282a36";
    fg = "#f8f8f2";

    black = "#21222C"; # AnsiBlack
    red = "#ff5555";
    green = "#50fa7b";
    yellow = "#f1fa8c";
    blue = "#BD93F9"; # AnsiBlue
    magenta = "#FF79C6"; # AnsiMagenta
    cyan = "#8be9fd";
    white = config.theme.fg;

    bright = {
      black = "#6272A4"; # AnsiBrightBlack
      red = "#FF6E6E"; # AnsiBrightRed
      green = "#69FF94"; # AnsiBrightGreen
      yellow = "#FFFFA5"; # AnsiBrightYellow
      blue = "#D6ACFF"; # AnsiBrightBlue
      magenta = "#FF92DF"; # AnsiBrightMagenta
      cyan = "#A4FFFF"; # AnsiBrightCyan
      white = "#FFFFFF"; # AnsiBrightWhite
    };

    color = "#6272a4"; # Comment
    colorFg = "#BD93F9"; # Purple
  };

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      dracula-vim
    ];

    extraConfig = ''
      set termguicolors
      colorscheme dracula
      let g:lightline = {'colorscheme': 'dracula'}
      "hi Normal guibg=${config.theme.bg}
    '';
  };

  programs.alacritty.settings.background_opacity = 0.8;
}
