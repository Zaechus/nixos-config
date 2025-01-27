{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../common/laptop
    ../../common/network/wired.nix
    ../../common/network/wireless.nix
    ../../common/graphical

    ../../common/ssh

    ./users/zaechus.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Intel
  hardware.cpu.intel.updateMicrocode = true;

  # Enforce fstab options
  fileSystems = {
    "/".options = [ "compress=zstd" "space_cache=v2" ];
    "/boot".options = [ "umask=0077" ];
    "/home".options = [ "compress=zstd" "space_cache=v2" ];
    "/nix".options = [ "compress=zstd" "noatime" "space_cache=v2" ];
    "/swap".options = [ "noatime" "nodatacow" "space_cache=v2" ];
  };

  # Swap
  swapDevices = [{ device = "/swap/swapfile"; }];

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Hostname
  networking.hostName = "gantrithor";

  system.stateVersion = "21.11";
}
