{ lib, ... }:

{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus.imports = [
    ../../../modules/home.nix
    #../../../themes/gruvbox
    ../../../themes/nord
    ../../../modules/graphical-home.nix
    ../../../modules/thinkpad-home.nix

    ../../../modules/nushell
  ];
}
