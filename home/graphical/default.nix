{
  imports = [
    ../alacritty
    ../chromium/brave.nix
    ../sway
    ../fonts
  ];

  gtk.enable = true;
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpg" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "image/png" = "imv.desktop";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # blue light filter
  services.gammastep = {
    enable = true;
    dawnTime = "05:30-06:30";
    duskTime = "20:30-21:30";
  };

  # speaker pause/play button
  services.mpris-proxy.enable = true;
}
