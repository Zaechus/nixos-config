{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # appimage-run # mcpelauncher
    bchunk
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    devilutionx # diablo
    dhewm3 # doom 3
    # ecwolf # wolf3d
    ironwail # quake
    ruffle # flash
    # scrcpy # android
  ];

  networking.firewall.allowedUDPPorts = [
    7551 # halo
    7777 # Terraria
    24642 # Stardew Valley
  ];

  networking.firewall.allowedTCPPorts = [
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
