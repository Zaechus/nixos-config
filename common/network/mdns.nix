{
  systemd.network = {
    networks."99-ethernet-default-dhcp" = {
      networkConfig = {
        MulticastDNS = true;
      };
      linkConfig = {
        Multicast = true;
      };
    };

    networks."99-wireless-client-dhcp" = {
      networkConfig = {
        MulticastDNS = true;
      };
      linkConfig = {
        Multicast = true;
      };
    };
  };

  networking.firewall.allowedUDPPorts = [ 5353 ];
}
