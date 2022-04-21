{ config, pkgs, ... }:

{
  imports = [
    ../modules/fonts
  ];

  environment.systemPackages = with pkgs; [
    imv mpv
    xdg-utils
  ];

  hardware.opengl = {
    # Wayland
    enable = true;
    # Vulkan
    driSupport = true;
    driSupport32Bit = true; # needed for some games
  };

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
