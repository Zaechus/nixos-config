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

    networks."99-ethernet-default-dhcp" = {
      dhcpV4Config = {
        UseDNS = false;
      };
      dhcpV6Config = {
        UseDNS = false;
      };
    };

    networks."99-wireless-client-dhcp" = {
      dhcpV4Config = {
        UseDNS = false;
      };
      dhcpV6Config = {
        UseDNS = false;
      };
    };
  };
}
