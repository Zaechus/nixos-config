{
  networking = {
    useNetworkd = true;
    useDHCP = false;

    nameservers = [ "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001" ];
    resolvconf.enable = false;
  };

  services.resolved = {
    enable = true;
    domains = [ "home" ];
  };

  systemd.services."systemd-networkd-wait-online".enable = false;
}
