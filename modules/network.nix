{
  networking = {
    useNetworkd = true;
    useDHCP = false;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    resolvconf.enable = false;
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "home" ];
    fallbackDns = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
      "8.8.8.8"
      "8.8.4.4"
      "2001:4860:4860::8888"
      "2001:4860:4860::8844"
    ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  systemd.services."systemd-networkd-wait-online".enable = false;
}
