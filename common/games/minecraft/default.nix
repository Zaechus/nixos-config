{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

  networking.firewall.allowedTCPPorts = [ 44444 ];
}
