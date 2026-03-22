{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      retroarch-joypad-autoconfig = prev.retroarch-joypad-autoconfig.overrideAttrs {
        src = prev.fetchFromGitHub {
          owner = "libretro";
          repo = "retroarch-joypad-autoconfig";
          rev = "c389f65e16f0044ddd9bb70da6af2a92c5f3ee42";
          hash = "sha256-G/Fs411ysC2kS20kQdo4su3Qo9YcNpSwd7e7sus/zys=";
        };
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    innoextract # extract GOG offline installers
    my.ley
    (retroarch.withCores (cores: with cores; [
      beetle-psx-hw # playstation
      # bluemsx # colecovision
      # dolphin # gamecube (outdated)
      fbneo # arcade (potentially bugged?)
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
    wineWow64Packages.staging # FIXME: NIXOS CANNOT GET WINE RIGHT
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
