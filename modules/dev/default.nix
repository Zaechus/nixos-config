{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tokei
  ];
}
