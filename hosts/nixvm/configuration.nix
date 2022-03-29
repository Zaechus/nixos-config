# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  autologin = pkgs.writeText "autologin-script.sh" ''
    if [[ "$(tty)" == "/dev/tty1" ]]; then
      ${pkgs.shadow}/bin/login -f zaechus;
    else
      ${pkgs.shadow}/bin/login;
    fi
  '';
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix /etc/nixos/swap-configuration.nix
      (import "${home-manager}/nixos")
      ../../common/nixos.nix
      ../../modules/chromium
      ./vm.nix
    ];

  home-manager.users.zaechus = (import ../../modules/common);

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

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lutris
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
