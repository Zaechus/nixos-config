{ pkgs, ... }:

{
  programs.sway.extraPackages = with pkgs; [ wayvnc ];

  networking.firewall.allowedTCPPorts = [ 5900 ];
}
