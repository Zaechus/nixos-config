{ config, pkgs, ... }:

{
  imports =
    [
      ./git.nix
      ./sway/default.nix
      ./zsh.nix
    ];
}
