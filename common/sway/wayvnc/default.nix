{ pkgs, ... }:

{
  programs.sway.extraPackages = with pkgs; [ wayvnc tigervnc ];

  networking.firewall.allowedTCPPorts = [ 5900 ];
}
