{
  imports = [
    ./.
  ];

  networking.wireless.iwd = {
    enable = true;
    # settings.General.EnableNetworkConfiguration = true; # AP mode
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
