{
  networking = {
    useNetworkd = true;
    useDHCP = false; # disable the default dhcp solution so networkd can configure it

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

  # I don't remember why but this needs to be here
  systemd.services."systemd-networkd-wait-online".enable = false;
}
