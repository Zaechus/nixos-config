{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    fira-code
    noto-fonts-emoji
  ];
}
