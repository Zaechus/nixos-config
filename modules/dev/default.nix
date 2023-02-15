{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clang # cc
    llvmPackages.bintools # lld
    nil # Nix LSP
    tokei
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
