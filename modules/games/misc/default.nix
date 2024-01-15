{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # appimage-run # mcpelauncher
    bchunk
    # cataclysmDDA.stable.curses # apparently this is separate and doesn't compile...
    dhewm3 # doom 3
    # ecwolf # wolf3d
    ironwail # quake
    ruffle # flash
    # scrcpy # android
  ];

  networking.firewall.allowedUDPPorts = [
    7551 # halo
    24642 # Stardew Valley
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
