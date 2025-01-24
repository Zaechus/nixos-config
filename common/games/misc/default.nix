{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # appimage-run # mcpelauncher
    bchunk # quake music tracks
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    my.devilutionx # diablo
    dhewm3 # doom 3
    # dolphin-emu # gamecube
    # duckstation # playstation
    # ecwolf # wolf3d
    ironwail # quake
    # minetest
    # ppsspp # playstation portable
    # my.rpcs3 # ps3
    ruffle # flash
    # scrcpy # android
    # wesnoth
    # my.xdvdfs # pack xiso
    # xemu # xbox
    # zeroad # 0ad
  ];

  networking.firewall.allowedUDPPorts = [
    7551 # Halo
    7777 # Terraria
    24642 # Stardew Valley
  ];

  networking.firewall.allowedTCPPorts = [
    6112 # Diablo
    7777 # Terraria
  ];

  programs.steam = {
    package = (pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        openssl_1_1 # for Stardew Valley
      ];
    });
  };

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w" # for inclusion in steam-run
  ];
}
