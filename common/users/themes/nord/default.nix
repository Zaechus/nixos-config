# https://github.com/arcticicestudio/nord
# https://www.nordtheme.com/docs/colors-and-palettes
# https://github.com/arcticicestudio/nord-alacritty/blob/develop/src/nord.yml

{ username, ... }: { config, pkgs, ... }:

{
  # programs.vivid = {
  #   enable = true;
  #   theme = "nord";
  # };

  users.users.${username} = {
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

      bright = with config.theme; {
        black = "#4C566A"; # nord3
        inherit red green yellow blue magenta;
        cyan = "#8FBCBB"; # nord7
        white = "#ECEFF4"; # nord6
      };

      primary = "#5E81AC"; # nord10
      secondary = config.theme.cyan;
    };

    packages = with pkgs; [
      numix-icon-theme
      nordic
    ];
    files.".gtkrc-2.0".source = ./gtk-2.0;
    files.".config/gtk-3.0/settings.ini".source = ./gtk-3.0;

    programs.bat.settings.theme = "Nord";

    programs.bottom.settings.flags.color = "nord";

    programs.helix.settings.theme = "nord";

    programs.git.config.delta.syntax-theme = "Nord";

    programs.zellij.settings.theme = "nord";

    files.".config/BraveSoftware/Brave-Browser/External Extensions/abehfkkfjlplnjadfcjiflnejblfmmpj.json".text = ''{"external_update_url":"https://clients2.google.com/service/update2/crx"}'';
  };
}
