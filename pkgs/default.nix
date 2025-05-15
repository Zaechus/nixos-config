final: prev: {
  my = {
    angband = final.callPackage ./angband { };
    bin2iso = final.callPackage ./bin2iso { };
    devilutionx = final.callPackage ./devilutionx { };
    dosbox-staging = final.callPackage ./dosbox-staging { };
    doukutsu-rs = final.callPackage ./doukutsu-rs { };
    ley = final.callPackage ./ley { };
    mangos-classic = final.callPackage ./mangos-classic { };
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    rpcs3 = final.callPackage ./rpcs3 { };
    rustatus = final.callPackage ./rustatus { };
    TheForceEngine = final.callPackage ./TheForceEngine { };
    tiny = final.callPackage ./tiny { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    xdvdfs-cli = final.callPackage ./xdvdfs-cli { };
    zinfo = final.callPackage ./zinfo { };
  };
}
