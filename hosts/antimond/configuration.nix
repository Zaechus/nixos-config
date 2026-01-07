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
  boot.postBootCommands = "${pkgs.fbset}/bin/fbset -a -xres 2560 -yres 1600";

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
    3657 # Star Wars: Battlefront
    3658 # Star Wars: Battlefront
    # 7551 # Halo
    7777 # Terraria
    24642 # Stardew Valley
    47584 # Dark Souls
  ];
  networking.firewall.allowedTCPPorts = [
    7777 # Terraria
    47584 # Dark Souls
  ];

  # Services
  services.fwupd.enable = true;
  services.udev.extraRules = builtins.readFile ./99-false-joysticks.rules;

  virtualisation.waydroid.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    anki
    ffmpeg
    imagemagick
    lftp
    scummvm
    sshfs

    my.adom1
    my.angband
    my.doukutsu-rs
    # my.endless-sky
    my.RBDOOM-3-BFG
  ];

  programs.steam.extraPackages = with pkgs; [
    # Hotline Miami
    pkgsi686Linux.libGLU
    pkgsi686Linux.openal
    pkgsi686Linux.nvidia_cg_toolkit
    pkgsi686Linux.xorg.libXrandr
  ];

  environment.sessionVariables.SDL_GAMECONTROLLER_IGNORE_DEVICES = "0x32ac/0x0012,0x32ac/0x0014"; # for some reason, the Framework Laptop 16 input modules are detected as evdev joysticks

  system.stateVersion = "24.05";
}
