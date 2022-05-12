{ config, pkgs, ... }:

{
  imports = [
    ../modules/alacritty
    ../modules/chromium
    ../modules/sway
  ];

  gtk.enable = true;
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps.enable = true;
  };
}
