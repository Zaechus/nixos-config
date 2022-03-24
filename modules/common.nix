{ config, pkgs, ... }:

{
  imports =
    [
      ./sway/sway.nix
      ./zsh.nix
    ];
}
