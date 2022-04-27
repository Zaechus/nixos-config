# The base configuration
#
# The default module includes basic system utilities and configuration that
# should be present on all systems.

{ config, pkgs, ... }:

{
  boot.loader.timeout = 1;
  powerManagement.cpuFreqGovernor = "schedutil";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    exa fd ripgrep
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shellAliases = {
    l = "exa --icons --color=always";
    ll = "l -aalg";
  };
}
