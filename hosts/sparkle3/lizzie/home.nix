{ pkgs, ... }:

{
  imports = [
    ../../../modules/home.nix
    ../../../themes/gruvbox
    ../../../modules/dev/home.nix
    ../../../modules/laptop/home.nix
  ];

  home = {
    homeDirectory = "/home/lizzie";
    username = "lizzie";
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
