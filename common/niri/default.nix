{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    xwayland-satellite
  ];

  programs.niri.enable = true;

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
}
