{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    innoextract # extract GOG offline installers
    my.ley
    (retroarch.override {
      cores = with libretro; [
        # beetle-psx-hw # playstation
        # beetle-saturn # saturn
        # dolphin # gamecube
        # fbneo # arcade
        freeintv # intellivision
        gambatte # game boy / gbc
        # genesis-plus-gx # genesis
        # mame # arcade
        mesen # nes
        mgba # gba
        mupen64plus # n64
        # parallel-n64 # n64
        prosystem # atari 7800
        snes9x # snes
        stella # atari 2600
        swanstation # ps1
      ];
    })
    wineWowPackages.staging
    winetricks
  ];

  programs.steam.enable = true; # includes steam-run for dumb binaries

  # LAN game ports
  networking.firewall.allowedUDPPortRanges = [
    { from = 6110; to = 6120; } # blizzard
  ];

  networking.firewall.allowedTCPPorts = [
    55435 # retroarch netplay
  ];
}
