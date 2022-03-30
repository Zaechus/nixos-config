{
  networking = {
    useNetworkd = true;
    wireless.iwd.enable = true;

    useDHCP = false;
  };

  systemd = {
    network.networks = {
      "20-wireless" = {
        enable = true;
        name = "wl*";
        DHCP = "yes";
        dhcpV4Config = {
          RouteMetric = 20;
        };
        dhcpV6Config = {
          RouteMetric = 20;
        };
      };
    };
    services."systemd-networkd-wait-online".enable = false;
  };
}
