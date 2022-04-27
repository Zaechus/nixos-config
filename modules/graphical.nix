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
    wrapperFeatures.gtk = true; # apparently improves gtk
    extraPackages = with pkgs; [
      bemenu swaylock wl-clipboard
      grim slurp # screenshot selection
      lm_sensors # for i3statur-rust temperature block
    ];
  };

  xdg.portal.wlr.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;
}
