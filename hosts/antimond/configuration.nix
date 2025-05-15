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
    ../../common/games/diablo
    ../../common/games/doom

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
    "amdgpu.abmlevel=0" # disable ABM
    # "amdgpu.dcdebugmask=0x10" # disable PSR
    # "amdgpu.dcdebugmask=0x400" # disable DISPLAY_PANEL_REPLAY
    # "amdgpu.dcdebugmask=0x410" # disable both
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

  networking.firewall.allowedUDPPorts = [
    47584 # Dark Souls
  ];
  networking.firewall.allowedTCPPorts = [
    47584 # Dark Souls
  ];

  # Services
  services.fwupd.enable = true;

  virtualisation.waydroid.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    ffmpeg
    lftp
    sshfs

    my.doukutsu-rs
    my.RBDOOM-3-BFG
  ];

  system.stateVersion = "24.05";
}
