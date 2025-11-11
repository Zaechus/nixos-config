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
      genesis-plus-gx # genesis
      mesen # nes
      mgba # gba
      mupen64plus # n64
      prosystem # atari 7800
      snes9x # snes
      stella # atari 2600
    ]))
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

  environment.sessionVariables = {
    SDL_GAMECONTROLLER_IGNORE_DEVICES = "0x32ac/0x0012,0x32ac/0x0014"; # for some reason, the Framework Laptop 16 input modules are detected as evdev joysticks
  };
}
