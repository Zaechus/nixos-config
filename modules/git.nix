{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "Zaechus";
    userEmail = "maxwell.anderson.public@protonmail.com";
  };
}
