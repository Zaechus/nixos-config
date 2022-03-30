{ config, pkgs, ... }:

{
  imports = [
    ../modules/fonts
  ];

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    imv
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu grim slurp swaylock wl-clipboard
    ];
  };

  #xdg.portal.wlr.enable = true;
}
