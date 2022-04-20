{ config, pkgs, ... }:

{
  imports = [
    ../modules/fonts
  ];

  environment.systemPackages = with pkgs; [
    imv
    xdg-utils
  ];

  # Wayland
  hardware.opengl.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu grim slurp swaylock wl-clipboard
    ];
  };

  xdg.portal.wlr.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;
}
