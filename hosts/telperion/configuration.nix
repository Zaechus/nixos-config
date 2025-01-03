{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix

    ../../modules/deluge
    ../../modules/ftp
    ../../modules/ssh
    ../../modules/network/wg-quick.nix
    ../../modules/bedrock-server
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
  fileSystems."/home/ftp/Downloads" = {
    device = "/var/lib/deluge/Downloads";
    options = [ "bind" ];
  };
  services.logind.lidSwitch = "ignore";
  systemd.network.networks = {
    "99-ethernet-default-dhcp".networkConfig.LinkLocalAddressing = false;
    "99-wireless-client-dhcp".linkConfig.ActivationPolicy = "down";
  };
  systemd.targets.tpm2.enable = false;

  # Packages
  environment.systemPackages = with pkgs; [
    steam-run
  ];

  # User
  users.users.narud = {
    isNormalUser = true;
    extraGroups = [ "deluge" "ftp" "bedrockserver" ];
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
