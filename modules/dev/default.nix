{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil # Nix LSP
    tokei
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
