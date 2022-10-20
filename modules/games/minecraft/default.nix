{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # prismlauncher
  ];

  networking.firewall.allowedTCPPortRanges = [
    { from = 33097; to = 45923; }
  ];
}
