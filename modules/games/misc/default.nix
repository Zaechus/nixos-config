{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bchunk
    dhewm3
    ironwail # quake
    ruffle # flash
  ];
}
