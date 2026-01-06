{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # appimage-run # mcpelauncher
    bchunk # quake music tracks
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    dhewm3 # doom 3
    # dolphin-emu # gamecube
    # duckstation # playstation
    # ecwolf # wolf3d
    # ironwail # quake
    # luanti # formerly minetest
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
    47584 # Dark Souls
  ];

  networking.firewall.allowedTCPPorts = [
    7777 # Terraria
    47584 # Dark Souls
  ];
}
