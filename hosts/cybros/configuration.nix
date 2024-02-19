{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/laptop
    ../../modules/graphical
    ../../modules/network/bluetooth.nix
    ../../modules/network/wireguard.nix

    ../../modules/dev
    ../../modules/slade
    ../../modules/virt

    ../../modules/games
    ../../modules/games/misc
    ../../modules/games/doom
    ../../modules/games/minecraft

    ./users/zaechus.nix
    ./users/lizzie.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # AMD
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.cpu.amd.updateMicrocode = true;

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
  networking.hostName = "cybros";

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs ripgrep
  environment.systemPackages = with pkgs; [
    aria2
    # brogue-ce
    ffmpeg
    imagemagick
    # infra-arcana
    p7zip
    scummvm
    rbdoom-3-bfg
    rogue

    my.angband
  ];

  system.stateVersion = "21.11";
}
