{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    innoextract # extract GOG offline installers
    my.ley
    (retroarch.withCores (cores: with cores; [
      beetle-psx-hw # playstation
      # bluemsx # colecovision
      # dolphin # gamecube (outdated)
      # fbneo # arcade (potentially bugged?)
      # freeintv # intellivision
      gambatte # game boy / gbc
      genesis-plus-gx # md
      mesen # nes
      mgba # gba
      mupen64plus # n64
      prosystem # atari 7800
      snes9x # snes
      stella # atari 2600
    ]))
    unzip
    # pinned.wineWowPackages.staging # 10.5
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
