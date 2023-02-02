final: prev: {
  my = {
    dosbox-staging = final.callPackage ./dosbox-staging { };
    iir1 = final.callPackage ./iir1 { };
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    zinfo = final.callPackage ./zinfo { };
  };
}
