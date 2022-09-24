{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    polymc
  ];

  networking.firewall.allowedTCPPortRanges = [
    { from = 33097; to = 45923; }
  ];
}
