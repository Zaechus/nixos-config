{ pkgs, ... }:

{
  imports = [ ../chromium ];

  environment.systemPackages = with pkgs; [
    brave
  ];

  environment.sessionVariables.BROWSER = "brave";
}
