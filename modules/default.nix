# The base configuration
#
# The default module includes basic system utilities and configuration that
# should be present on all systems.

{ config, pkgs, lib, ... }:

{
  boot.loader.timeout = 1;
  powerManagement.cpuFreqGovernor = "schedutil";

  nix.autoOptimiseStore = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    exa fd ripgrep
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shellAliases = {
    l = "exa --icons --color=always";
    ll = "l -aalg";
    nix-query = "nix-store -q --references /run/current-system/sw | rg -v man | sed 's/^[^-]*-//g' | sed 's/-[0-9].*//g' | rg -v '^nix' | sort -u | $PAGER";
  };

  services.getty = {
    greetingLine = "NixOS ${builtins.substring 0 5 config.system.nixos.label} (\\m) - \\l";
    helpLine = lib.mkForce "";
  };
  users.motd = "\nHello, sailor!\n\n";
}
