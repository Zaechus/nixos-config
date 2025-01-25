{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../common/network/wired.nix
    ../../common/network/wireless.nix
    ../../common/network/bluetooth.nix
    ../../common/laptop
    ../../common/graphical

    ../../common/games

    ./users/zaechus.nix
  ];

  # systemd-boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # AMD
  hardware.amdgpu.initrd.enable = true;
  hardware.cpu.amd.updateMicrocode = true;
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x10" # disable PSR
    "amdgpu.abmlevel=0" # disable ABM
  ];

  # Enable trim
  boot.initrd.luks.devices."root".allowDiscards = true;
  services.fstrim.enable = true;

  # Enforce fstab options
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/boot".options = [ "umask=0077" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
    "/swap".options = [ "noatime" "nodatacow" ];
  };

  # Swap
  swapDevices = [{ device = "/swap/swapfile"; }];

  # Time Zone
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "antimond";

  services.fwupd.enable = true;
  environment.systemPackages = with pkgs; [
    alacritty
    git
    helix
  ];

  system.stateVersion = "24.05";
}
