{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dhewm3
    ironwail # quake
    ruffle # flash
  ];
}
