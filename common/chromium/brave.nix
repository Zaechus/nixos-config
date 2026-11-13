{ pkgs, ... }:

{
  imports = [ ../chromium ];

  environment.systemPackages = with pkgs; [
    brave-origin
  ];

  environment.sessionVariables.BROWSER = "brave-origin";
}
