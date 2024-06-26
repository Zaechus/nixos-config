{ pkgs, ... }:

{
  imports = [
    ../fonts
    ../sway
  ];

  environment.systemPackages = with pkgs; [
    imv
    mpv
    xdg-utils # need this for copy/paste images and other stuff
  ];

  services.udisks2 = {
    enable = true;
    settings."mount_options.conf" = {
      defaults = {
        btrfs_defaults = "compress=zstd";
      };
    };
  };

  hardware.opengl = {
    # Wayland
    enable = true;
    # Vulkan
    driSupport = true;
    driSupport32Bit = true; # needed for some games
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
  sound.enable = true; # alsamixer, amixer, speaker-test, saves sound state
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
