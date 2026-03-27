{ pkgs, lib, modulesPath, ... }:

let
  username = "nixos";
in
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    ../../modules
    ../../common
    ../../common/network/wired.nix
    ../../common/network/wireless.nix
    ../../common/network/bluetooth.nix
    ../../common/laptop
    ../../common/graphical
    (import ../../common/users { inherit username; })
    (import ../../common/users/themes/gruvbox { inherit username; })
    (import ../../common/users/graphical { inherit username; })
    (import ../../common/users/games/dosbox { inherit username; })
    (import ../../common/users/games/nethack { inherit username; })
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    files.".config/nushell/login.nu".text = lib.mkForce "\n";
    programs.sway.config.startup = lib.mkForce [];
  };

  boot = {
    loader.timeout = lib.mkForce 5;
    supportedFilesystems.zfs = lib.mkForce false;
  };
  networking = {
    firewall.enable = false;
    wireless.enable = lib.mkForce false;
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    innoextract
    lftp
    (retroarch.withCores (cores: with cores; [
      beetle-psx-hw # playstation
      gambatte # game boy / gbc
      genesis-plus-gx # md
      mesen # nes
      mgba # gba
      mupen64plus # n64
      prosystem # atari 7800
      snes9x # snes
      stella # atari 2600
    ]))
    unzip
    wineWow64Packages.staging
    winetricks

    my.angband
    my.endless-sky
  ];
}
