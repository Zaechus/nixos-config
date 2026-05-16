{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kiwix
    kiwix-tools
  ];

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
