{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../common/network/wired.nix
    ../../common/network/wireless.nix

    ../../common/deluge
    ../../common/ftp
    ../../common/ssh
    ../../common/network/wg-quick.nix

    (import ../../common/users { username = "narud"; })
    (import ../../common/users/dev/zellij { username = "narud"; })
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
    "/boot".options = [ "umask=0077" ];
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

  # Options
  fileSystems."/home/ftp/Downloads" = {
    device = "/var/lib/deluge/Downloads";
    options = [ "bind" ];
  };
  services.logind.lidSwitch = "ignore";
  systemd.network.networks = {
    "99-ethernet-default-dhcp".networkConfig.LinkLocalAddressing = false;
    "99-wireless-client-dhcp".linkConfig.ActivationPolicy = "down";
  };
  systemd.targets.tpm2.enable = false;

  # User
  users.users.narud = {
    isNormalUser = true;
    extraGroups = [ "deluge" "ftp" "systemd-journal" ];

    files.".config/deluge/auth".source = ../../common/deluge/auth;
  };

  system.stateVersion = "24.11";
}
