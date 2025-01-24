{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira
      fira-code
      font-awesome
      iosevka
    ];

    fontconfig = {
      defaultFonts.monospace = [ "Iosevka Extended" ];
      hinting.enable = false;
      subpixel.lcdfilter = "light"; # fix for status bar characters
    };
  };
}
