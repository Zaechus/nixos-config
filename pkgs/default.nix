final: prev: {
  my = {
    angband = final.callPackage ./angband { };
    dosbox-staging = final.callPackage ./dosbox-staging { };
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    rustatus = final.callPackage ./rustatus { };
    TheForceEngine = final.callPackage ./TheForceEngine { };
    tiny = final.callPackage ./tiny { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    zinfo = final.callPackage ./zinfo { };
  };
}
