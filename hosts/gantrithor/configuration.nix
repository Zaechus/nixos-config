{ pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz";
in {
  imports = [
    /etc/nixos/hardware-configuration.nix /etc/nixos/swap-configuration.nix
    ../../modules
    ../../modules/graphical.nix
    ../../modules/thinkpad.nix
    ../../modules/wired.nix
    ../../modules/wireless.nix
    (import "${home-manager}/nixos")
    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "gantrithor";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #environment.systemPackages = with pkgs; [];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "21.11"; # Did you read the comment?
}
