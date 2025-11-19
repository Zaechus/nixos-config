{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wayvnc ];

  networking.firewall.allowedTCPPorts = [ 5900 ];
}
