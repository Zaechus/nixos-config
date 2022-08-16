{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/wired.nix
    ../../modules/wireless.nix
    ../../modules/laptop.nix
    ../../modules/graphical.nix
    ../../modules/bluetooth.nix
    ../../modules/dev
    ../../modules/dev/rust

    ../../modules/games/angband
    ../../modules/games/minecraft
    ../../modules/virt

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
  swapDevices = [ { device = "/swap/swapfile"; } ];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "cybros";

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs wget
  environment.systemPackages = let
    zinfo = pkgs.callPackage ../../pkgs/zinfo {};
  in with pkgs; [
    aria2
    lutris
    zinfo
  ];

  programs.steam.enable = true; # includes steam-run for dumb binaries

  # List services that you want to enable:

  system.stateVersion = "21.11"; # Did you read the comment?
}
