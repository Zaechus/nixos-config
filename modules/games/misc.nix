{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dhewm3
    ruffle # flash
  ];
}
