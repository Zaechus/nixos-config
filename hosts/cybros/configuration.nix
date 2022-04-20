{ pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz";
in {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules
    ../../modules/wired.nix
    ../../modules/wireless.nix
    ../../modules/laptop.nix
    ../../modules/graphical.nix
    ../../modules/dev.nix

    ../../modules/virt-manager

    (import "${home-manager}/nixos")
    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Swap
  swapDevices = [ { device = "/var/swapfile"; } ];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "cybros";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lutris
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "21.11"; # Did you read the comment?
}
