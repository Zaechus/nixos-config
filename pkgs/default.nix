final: prev: {
  my = {
    bottles = final.callPackage ./bottles { };
    dosbox-staging = final.callPackage ./dosbox-staging { };
    fvs = final.callPackage ./fvs { };
    icoextract = final.callPackage ./icoextract { };
    iir1 = final.callPackage ./iir1 { };
    lutris = final.callPackage ./lutris { };
    RBDOOM-3-BFG = final.callPackage ./RBDOOM-3-BFG { };
    UltimateDoomBuilder = final.callPackage ./UltimateDoomBuilder { };
    vkbasalt-cli = final.callPackage ./vkbasalt-cli { };
    zinfo = final.callPackage ./zinfo { };
  };
}
