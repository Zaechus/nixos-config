{
  systemd.network = {
    networks."99-ethernet-default-dhcp" = {
      networkConfig = {
        MulticastDNS = true;
      };
    };

    networks."99-wireless-client-dhcp" = {
      networkConfig = {
        MulticastDNS = true;
      };
    };
  };

  networking.firewall.allowedUDPPorts = [ 5353 ];
}
