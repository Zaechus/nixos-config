{
  imports = [
    ./network.nix
  ];

  systemd.network.networks = {
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
}
