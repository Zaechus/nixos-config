# { pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/laptop
    ../../modules/network/wireguard.nix
    ../../modules/rtorrent
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

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs ripgrep
  # environment.systemPackages = with pkgs; [
  #   # aria2 # torrent
  #   # du-dust
  #   # pciutils # #lspci
  # ];

  # User
  users.users.narud = {
    isNormalUser = true;
  };

  home-manager.users.narud = {
    imports = [
      ../../modules/home.nix
    ];

    home.stateVersion = "24.11";
  };

  system.stateVersion = "24.11";
}
