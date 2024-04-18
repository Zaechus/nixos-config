{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    innoextract # extract GOG offline installers
    my.ley
    (retroarch.override {
      cores = with libretro; [
        # beetle-saturn # saturn
        # dolphin # gamecube
        freeintv # intellivision
        gambatte # game boy
        genesis-plus-gx # genesis
        mame # arcade
        mesen # nes
        mgba # game boy advanced
        mupen64plus # n64
        prosystem # atari 7800
        snes9x # snes
        stella # atari 2600
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
}
