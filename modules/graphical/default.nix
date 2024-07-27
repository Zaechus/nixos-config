{ pkgs, ... }:

{
  imports = [
    ../fonts
    ../sway
  ];

  environment.systemPackages = with pkgs; [
    alsa-utils
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

  # Wayland/Vulkan
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
