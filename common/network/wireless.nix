{
  imports = [
    ./.
  ];

  networking.wireless.iwd = {
    enable = true;
    # settings.General.EnableNetworkConfiguration = true; # AP mode
    settings.Rank = {
      BandModifier5GHz = 4.0;
      BandModifier6GHz = 4.0;
    };
  };

  systemd.network.networks."99-wireless-client-dhcp" = {
    dhcpV4Config = {
      UseDNS = false;
    };
    dhcpV6Config = {
      UseDNS = false;
    };
  };
}
