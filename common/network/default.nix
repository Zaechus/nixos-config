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

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = "true";
      DNSSEC = "true";
      LLMNR = "false";
    };
  };

  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
  };
}
