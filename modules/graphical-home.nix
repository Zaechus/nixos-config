{ config, pkgs, ... }:

{
  imports = [
    ../modules/alacritty
    ../modules/chromium
    ../modules/sway
  ];

  xdg.enable = true;
}
