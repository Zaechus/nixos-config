{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../common/network/wired.nix
    ../../common/network/wireless.nix
    ../../common/laptop
    ../../common/graphical
    ../../common/network/bluetooth.nix
    ../../common/network/wg-quick.nix

    ../../common/games
    ../../common/games/misc.nix
    ../../common/games/xvt.nix
    ../../common/games/diablo
    ../../common/games/doom
    ../../common/games/minecraft

    ../../common/waydroid

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
    ppsspp # psp
    scummvm
    rbdoom-3-bfg
    rogue
    umoria

    my.angband
  ];

  system.stateVersion = "21.11";
}
