{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # appimage-run # mcpelauncher
    bchunk # quake music tracks
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    my.devilutionx # diablo
    dhewm3 # doom 3
    # ecwolf # wolf3d
    ironwail # quake
    # minetest
    rpcs3 # playstation 3
    ruffle # flash
    # scrcpy # android
    # wesnoth
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
