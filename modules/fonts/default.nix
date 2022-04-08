{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts-emoji
  ];
}
