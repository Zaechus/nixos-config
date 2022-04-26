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
    ../../modules/dev
    ../../modules/dev/rust

    ../../modules/angband
    ../../modules/virt-manager

    (import "${home-manager}/nixos")
    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # AMD
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Enforce btrfs zstd compression in fstab
  fileSystems."/".options = [ "compress=zstd" ];
  fileSystems."/home".options = [ "compress=zstd" ];

  # Swap
  swapDevices = [ { device = "/var/swapfile"; } ];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "cybros";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    links
    aria2
    lutris unzip
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
