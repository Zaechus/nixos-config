{
  networking = {
    useNetworkd = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  systemd.network = {
    enable = true;
    wait-online = {
      anyInterface = true;
    };
    networks.all = {
      matchConfig.Name = "en* wl*";
      dhcpV4Config = {
        UseDNS = false;
      };
      dhcpV6Config = {
        UseDNS = false;
      };
    };
  };
}
