{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira
      fira-code
      font-awesome
      iosevka
      # liberation_ttf
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      defaultFonts.monospace = [ "Iosevka Extended" ];
      hinting.enable = false;
      subpixel.lcdfilter = "light"; # fix for status bar characters
    };
  };
}
