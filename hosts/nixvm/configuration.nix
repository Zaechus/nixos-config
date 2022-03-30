# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz";
  autologin = pkgs.writeText "autologin-script.sh" ''
    if [[ "$(tty)" == "/dev/tty1" ]]; then
      ${pkgs.shadow}/bin/login -f zaechus;
    else
      ${pkgs.shadow}/bin/login;
    fi
  '';
in {
  imports = [
    /etc/nixos/hardware-configuration.nix /etc/nixos/swap-configuration.nix
    ../../modules
    ../../modules/wired.nix
    ../../modules/desktop.nix
    (import "${home-manager}/nixos")
    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TTY1 Autologin
  services.getty = {
    loginProgram = "${pkgs.bash}/bin/sh";
    loginOptions = toString autologin;
    extraArgs = [ "--skip-login" ];
  };

  networking.hostName = "nixvm"; # Define your hostname.

  time.timeZone = "America/Denver";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lutris
  ];

  environment.sessionVariables = rec {
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };

  system.stateVersion = "21.11"; # Did you read the comment?
}
