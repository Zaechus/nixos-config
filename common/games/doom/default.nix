{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    crispyDoom
  ];

  networking.firewall.allowedUDPPorts = [ 2342 ];
}
