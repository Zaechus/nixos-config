final: prev: {
  my = {
    dosbox-staging = final.callPackage ./dosbox-staging { };
    iir1 = final.callPackage ./iir1 { }; # dosbox-staging
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    TheForceEngine = final.callPackage ./TheForceEngine { };
    tiny = final.callPackage ./tiny { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    zinfo = final.callPackage ./zinfo { };
  };
}
