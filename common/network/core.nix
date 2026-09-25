{
  imports = [
    ./mdns.nix
  ];

  networking = {
    nftables.enable = true;
    useNetworkd = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  services.resolved.enable = true;

  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;

    networks."40-wg0" = {
      matchConfig.Type = "wireguard";
      networkConfig.DNSOverTLS = false;
    };

    networks."99-ethernet-default-dhcp" = {
      matchConfig = {
        Kind = "!*";
        Type = "ether";
      };
      DHCP = "yes";
      dhcpV4Config = {
        UseDNS = false;
      };
      dhcpV6Config = {
        UseDNS = false;
      };
      ipv6AcceptRAConfig = {
        UseDNS = false;
      };
    };

    networks."99-wireless-client-dhcp" = {
      matchConfig.WLANInterfaceType = "station";
      DHCP = "yes";
      dhcpV4Config = {
        RouteMetric = 1025;
        UseDNS = false;
      };
      dhcpV6Config = {
        UseDNS = false;
      };
      ipv6AcceptRAConfig = {
        RouteMetric = 1025;
        UseDNS = false;
      };
    };
  };
}
