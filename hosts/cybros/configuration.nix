{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/laptop
    ../../modules/graphical
    ../../modules/network/bluetooth.nix

    ../../modules/dev
    ../../modules/dev/rust

    ../../modules/virt

    ../../modules/games
    ../../modules/games/angband
    ../../modules/games/minecraft

    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable trim
  boot.initrd.luks.devices."root".allowDiscards = true;
  services.fstrim.enable = true;

  # AMD
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Enforce fstab options
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/swap".options = [ "noatime" ];
  };

  # Swap
  swapDevices = [{ device = "/swap/swapfile"; }];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "cybros";

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs ripgrep
  environment.systemPackages = with pkgs; [
    aria2
    p7zip
    (pkgs.callPackage ../../pkgs/ultimatedoombuilder {})
  ];

  # List services that you want to enable:

  system.stateVersion = "21.11"; # Did you read the comment?
}
