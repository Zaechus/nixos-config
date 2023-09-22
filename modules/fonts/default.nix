{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira
      fira-code
    ];

    fontconfig = {
      defaultFonts.monospace = [ "Fira Code" ];
      hinting.enable = false;
      subpixel.lcdfilter = "light"; # fix for status bar characters
    };
  };
}
