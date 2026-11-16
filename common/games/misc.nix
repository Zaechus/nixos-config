{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    dhewm3 # doom 3
    dolphin-emu # gamecube / wii
    # ecwolf # wolfenstein 3d
    # luanti # formerly minetest
    ppsspp # playstation portable
    # my.rpcs3 # ps3
    ruffle # flash
    # wesnoth
    # my.xdvdfs # pack xiso
    # xemu # xbox
    # zeroad # 0ad
  ];
}
