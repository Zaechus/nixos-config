{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      dejavu_fonts
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "FiraCode Nerd Font" ];
      };
      subpixel.lcdfilter = "light";
    };
  };
}
