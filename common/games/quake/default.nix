{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bchunk # music tracks
    ironwail # quake
  ];

  networking.firewall.allowedUDPPorts = [ 26000 ];
}
