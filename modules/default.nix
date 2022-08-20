# The base configuration
#
# The default module includes basic system utilities and configuration that
# should be present on all systems.

{ config, pkgs, lib, ... }:

{
  boot.loader.timeout = 1;
  powerManagement.cpuFreqGovernor = "schedutil";

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 32d";
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    let
      zinfo = pkgs.callPackage ../pkgs/zinfo { };
    in
    with pkgs; [
      exa
      fd
      ouch
      ripgrep
      zinfo
    ];
  environment.defaultPackages = [ pkgs.helix ];
  environment.variables = {
    EDITOR = "hx";
  };

  users.defaultUserShell = pkgs.nushell;
  environment.shells = [ pkgs.nushell ];

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
