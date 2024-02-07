{
  imports = [
    ./.
  ];

  systemd.network.networks."99-ethernet-default-dhcp" = {
    dhcpV4Config = {
      UseDNS = false;
    };
    dhcpV6Config = {
      UseDNS = false;
    };
  };
}
