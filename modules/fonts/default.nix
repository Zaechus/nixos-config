{ config, pkgs, ... }:

{
  imports = [
    ../options.nix
  ];

  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira
      fira-code
      font-awesome
      iosevka
    ];

    fontconfig = {
      defaultFonts.monospace = [ config.fonts.monospace ];
      hinting.enable = false;
      subpixel.lcdfilter = "light"; # fix for status bar characters
    };

    monospace = "Iosevka Extended";
  };
}
