# The base configuration
#
# The default module includes basic system utilities that should be present on all systems.

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  powerManagement.cpuFreqGovernor = "schedutil";

  environment.systemPackages = with pkgs; [
    exa fd ripgrep
    bottom
    git
  ];

  users.defaultUserShell = pkgs.zsh;
}
