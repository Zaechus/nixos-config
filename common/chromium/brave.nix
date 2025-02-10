{ pkgs, ... }:

{
  imports = [ ../chromium ];

  environment.systemPackages = with pkgs; [
    brave
  ];
}
