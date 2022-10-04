{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lutris
  ];

  programs.steam.enable = true; # includes steam-run for dumb binaries

  # open blizzard ports
  networking.firewall.allowedUDPPortRanges = [
    { from = 6110; to = 6120; }
  ];
}
