{
  imports = [
    ./mdns.nix
  ];

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
    dnsovertls = "true";
    llmnr = "false";
  };

  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
  };
}
