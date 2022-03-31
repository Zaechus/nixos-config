# The base configuration
#
# The default module includes basic system utilities that should be present on all systems.

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bat exa fd ripgrep
    bottom
    git
  ];

  users.defaultUserShell = pkgs.zsh;
}
