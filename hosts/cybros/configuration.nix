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
    ./wireguard.nix

    ../../modules/dev

    ../../modules/games
    ../../modules/games/misc
    ../../modules/games/misc/xvt.nix
    ../../modules/games/doom
    ../../modules/games/minecraft

    ../../modules/waydroid

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
    aria2 # torrent
    brogue-ce
    # crawl
    du-dust
    eza # exa
    ffmpeg
    # gimp
    # glxinfo # glxgears
    imagemagick
    # infra-arcana
    lftp
    # libwebp # dwebp
    # mkvtoolnix-cli # mkvmerge
    p7zip
    pciutils # lspci
    poppler_utils # pdf
    scummvm
    rbdoom-3-bfg
    rogue
    umoria

    my.angband
  ];

  system.stateVersion = "21.11";
}
