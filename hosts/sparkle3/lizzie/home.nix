{ pkgs, ... }:

{
  imports =
    [
      ../../modules/home.nix
      ../../themes/gruvbox
      ../../modules/laptop-home.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
