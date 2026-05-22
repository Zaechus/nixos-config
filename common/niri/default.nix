{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  programs.niri.enable = true;

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
}
