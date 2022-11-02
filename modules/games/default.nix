{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # bottles # Wine (if it wasn't so broken)
    # heroic # GOG
    innoextract # extract GOG offline installers
    lutris # everything
    (retroarch.override {
      cores = with libretro; [
        # beetle-saturn # saturn
        bsnes # snes
        freeintv # intellivision
        gambatte # game boy
        genesis-plus-gx # genesis
        mesen # nes
        mgba # game boy advanced
        mupen64plus # n64
        nestopia # nes
        prosystem # atari 7800
        snes9x # snes
        stella # atari 2600
      ];
    })
  ];

  programs.steam.enable = true; # includes steam-run for dumb binaries

  # open blizzard ports
  networking.firewall.allowedUDPPortRanges = [
    { from = 6110; to = 6120; }
  ];
}
