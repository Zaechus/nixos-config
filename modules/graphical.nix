{ config, pkgs, ... }:

{
  imports = [
    ../modules/fonts
  ];

  environment.systemPackages = with pkgs; [
    imv mpv wf-recorder
    xdg-utils # need this for copy/paste images and other stuff
    alsa-utils # alsamixer, amixer
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
      lm_sensors # for i3status-rust temperature block
    ];
  };

  xdg = {
    # Make things like screen capture work
    portal = {
      enable = true;
      wlr.enable = true;
    };

    mime = {
      enable = true;
      defaultApplications = {
        "image/jpg" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "image/png" = "imv.desktop";
      };
    };
  };

  # Enable sound
  sound.enable = true; # saves sound state in alsamixer
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
