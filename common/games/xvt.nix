{
  # Star Wars: X-Wing vs. TIE Fighter

  networking.firewall.allowedTCPPorts = [
    47624
  ];

  networking.firewall.allowedUDPPorts = [
    6073
  ];

  networking.firewall.allowedTCPPortRanges = [
    { from = 2300; to = 2400; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 2300; to = 2400; }
  ];
}
