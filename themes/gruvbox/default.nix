# https://github.com/morhetz/gruvbox
# https://github.com/gruvbox-community/gruvbox
# https://raw.githubusercontent.com/wiki/gruvbox-community/gruvbox/images/gruvbox_palette_dark.png
# https://github.com/alacritty/alacritty-theme/blob/master/themes/gruvbox_dark.toml

{ username, ... }: { pkgs, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    bg = "#282828"; # bg 235
    fg = "#ebdbb2"; # fg 223

    bg1 = "#3c3836"; # bg1 237
    fg0 = "fbf1c7"; # fg0 229

    black = "#282828"; # bg 235
    red = "#cc241d"; # red 124
    green = "#98971a"; # green 106
    yellow = "#d79921"; # yellow 172
    blue = "#458588"; # blue 66
    magenta = "#b16286"; # purple
    cyan = "#689d6a"; # aqua 72
    white = "#a89984"; # gray 246

    bright = {
      black = "#928374"; # gray 245
      red = "#fb4934"; # red 167
      green = "#b8bb26"; # green 142
      yellow = "#fabd2f"; # yellow 214
      blue = "#83a598"; # blue 109
      magenta = "#d3869b"; # purple 175
      cyan = "#8ec07c"; # aqua 108
      white = "#ebdbb2"; # fg 223
    };

    primary = "#665c54"; # bg3 241
    secondary = "#fe8019"; # orange 208
  };

  programs.git.config.delta.syntax-theme = "gruvbox-dark";

  # https://chrome.google.com/webstore/detail/czo-gruvbox64-theme/hmalklkailocblgkjpdagjoieifkdfbj
  programs.chromium.extensions = [ "hmalklkailocblgkjpdagjoieifkdfbj" ];

  programs.bat.settings.theme = "gruvbox-dark";

  programs.vivid = {
    enable = true;
    theme = "gruvbox-dark";
  };

  users.users.${username} = {
    packages = with pkgs; [
      gruvbox-dark-icons-gtk
      gruvbox-dark-gtk
    ];
    files.".gtkrc-2.0".source = ./gtk-2.0;
    files.".config/gtk-3.0/settings.ini".source = ./gtk-3.0;

    programs.bottom.settings.flags.color = "gruvbox";

    programs.helix.settings.theme = "gruvbox";

    programs.zellij.settings.theme = "gruvbox";
  };

  # # use bg2 as black for contrast in some terminal games
  # programs.nushell.extraConfig = let new_black = "#504945"; in ''
  #   def --wrapped nethack [
  #     --nao
  #     ...args: string
  #   ] {
  #     printf '\e]4;0;${new_black}'
  #     if $nao {
  #       printf '\e]4;0;${new_black}'; ssh nethack@alt.org
  #     } else {
  #       ^nethack ...$args
  #     }
  #     printf '\e]4;0;${config.theme.black}'
  #   }
  # '';
}
