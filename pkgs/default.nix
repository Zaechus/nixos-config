final: prev: {
  my = {
    adom = final.callPackage ./adom { };
    adom1 = final.pkgsi686Linux.callPackage ./adom1 { };
    adom2 = final.callPackage ./adom2 { };
    adom3 = final.callPackage ./adom3 { };
    angband = final.callPackage ./angband { };
    bin2iso = final.callPackage ./bin2iso { };
    devilutionx = final.callPackage ./devilutionx { };
    dosbox-staging = final.callPackage ./dosbox-staging { };
    doukutsu-rs = final.callPackage ./doukutsu-rs { };
    endless-sky = final.callPackage ./endless-sky { };
    ley = final.callPackage ./ley { };
    mangos-classic = final.callPackage ./mangos-classic { };
    openssl_1_0_2 = final.pkgsi686Linux.callPackage ./openssl_1_0_2 { };
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    rpcs3 = final.callPackage ./rpcs3 { };
    rustatus = final.callPackage ./rustatus { };
    TheForceEngine = final.callPackage ./TheForceEngine { };
    tiny = final.callPackage ./tiny { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    waypipe = final.callPackage ./waypipe { };
    xdvdfs-cli = final.callPackage ./xdvdfs-cli { };
    zinfo = final.callPackage ./zinfo { };
  };
}
