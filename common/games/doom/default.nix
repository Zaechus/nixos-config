{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    crispy-doom
  ];

  networking.firewall.allowedUDPPorts = [ 2342 ];
}
