{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil # Nix LSP
    tokei
  ];
}
