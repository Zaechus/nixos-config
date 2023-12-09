{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bchunk
    dhewm3 # doom 3
    # ecwolf # wolf3d
    ironwail # quake
    ruffle # flash
  ];
}
