{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # bottles # broken on both upstream and downstream again lol
    innoextract # extract GOG offline installers
    (lutris.override {
      extraPkgs = pkgs: [ wine ]; # sigh: https://github.com/lutris/lutris/issues/512
    })
    (retroarch.override {
      cores = with libretro; [
        # beetle-saturn # saturn
        dolphin # gamecube
        freeintv # intellivision
        gambatte # game boy
        genesis-plus-gx # genesis
        mesen # nes
        mgba # game boy advanced
        mupen64plus # n64
        prosystem # atari 7800
        snes9x # snes
        stella # atari 2600
      ];
    })
    ruffle # flash
    wineWowPackages.staging
  ];

  programs.steam.enable = true; # includes steam-run for dumb binaries

  # LAN game ports
  networking.firewall.allowedUDPPortRanges = [
    { from = 6110; to = 6120; } # blizzard
  ];
  networking.firewall.allowedUDPPorts = [
    7551 # halo
  ];
}
