{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    my.devilutionx # diablo
  ];

  networking.firewall.allowedTCPPorts = [ 6112 ];
}
