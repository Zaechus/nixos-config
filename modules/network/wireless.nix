{
  imports = [
    ./.
  ];

  networking.wireless.iwd = {
    enable = true;
    # settings.General.EnableNetworkConfiguration = true; # AP mode
  };
}
