{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/network/bluetooth.nix
    ../../modules/laptop
    ../../modules/graphical

    ../../modules/games

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

  system.stateVersion = "24.05";
}
