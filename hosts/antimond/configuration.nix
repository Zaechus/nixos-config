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
    "amdgpu.abmlevel=0" # disable ABM
    # "amdgpu.dcdebugmask=0x10" # disable PSR
    # "amdgpu.dcdebugmask=0x400" # disable DISPLAY_PANEL_REPLAY
    "video=2560x1600"
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
    47584
  ];
  networking.firewall.allowedTCPPorts = [
    47584
  ];

  services.fwupd.enable = true;

  virtualisation.waydroid.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_6_6; # FIXME: using 6.6 fixes graphical issues, 6.12 was having issues

  system.stateVersion = "24.05";
}
