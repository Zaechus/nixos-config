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

  # blue light filter
  services.gammastep = {
    enable = true;
    dawnTime = "05:30-06:30";
    duskTime = "08:30-09:30";
  };
}
