{
  imports = [
    ./network.nix
  ];

  networking.wireless.iwd.enable = true;

  systemd.network.networks = {
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
}
