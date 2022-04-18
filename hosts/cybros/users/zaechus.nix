{ lib, ... }:

{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus.imports = [
    ../../../modules/home.nix
    ../../../themes/gruvbox
    ../../../modules/graphical-home.nix
    ../../../modules/thinkpad-home.nix

    ../../../modules/nushell
  ];
}
