{
  networking = {
    useNetworkd = true;

    useDHCP = false;
  };

  systemd = {
    network.networks = {
      "10-wired" = {
        enable = true;
        name = "enp*";
        DHCP = "yes";
        dhcpV4Config = {
          RouteMetric = 10;
        };
        dhcpV6Config = {
          RouteMetric = 10;
        };
      };
    };
    services."systemd-networkd-wait-online".enable = false;
  };
}
