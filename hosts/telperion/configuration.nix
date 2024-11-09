{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/laptop

    ../../modules/deluge
    ../../modules/ftp
    ../../modules/ssh
    ../../modules/network/wg-quick.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Intel
  hardware.cpu.intel.updateMicrocode = true;

  # Enable trim
  boot.initrd.luks.devices."root".allowDiscards = true;
  services.fstrim.enable = true;

  # Enforce fstab options
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/swap".options = [ "noatime" "nodatacow" ];
  };

  # Swap
  swapDevices = [{ device = "/swap/swapfile"; }];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "telperion";

  # Options
  services.logind = lib.mkForce {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };
  services.vsftpd.anonymousUserHome = "/var/lib/deluge/Downloads";
  systemd.network.networks.wlan0.linkConfig.ActivationPolicy = "down";
  systemd.targets.tpm2.enable = false;

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs ripgrep
  # environment.systemPackages = with pkgs; [
  #   deluge
  # ];

  # User
  users.users.narud = {
    isNormalUser = true;
    extraGroups = [ "deluge" "ftp" ];
  };

  home-manager.users.narud = {
    imports = [
      ../../modules/home.nix
      ../../modules/zellij

      ../../modules/deluge/home.nix
    ];

    home.stateVersion = "24.11";
  };

  system.stateVersion = "24.11";
}
