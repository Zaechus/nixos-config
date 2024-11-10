{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/laptop
    ../../modules/network/wired.nix
    ../../modules/network/wireless.nix
    ../../modules/graphical

    ../../modules/ssh

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
  networking.hostName = "gantrithor";

  # List packages installed in system profile. To search, run:
  # $ nix search nixpkgs wget
  #environment.systemPackages = with pkgs; [];

  system.stateVersion = "21.11"; # Did you read the comment?
}
