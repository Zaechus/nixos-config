{ pkgs, ... }:

{
  # https://github.com/PolyMC/PolyMC/blob/develop/packages/nix/NIX.md
  nixpkgs.overlays = [
    (import (builtins.fetchTarball "https://github.com/PolyMC/PolyMC/archive/5adcc26190b82dc9c1050452645d762f5e8b5a5e.tar.gz")).overlay
  ];

  home.packages = with pkgs; [ polymc ];
}
