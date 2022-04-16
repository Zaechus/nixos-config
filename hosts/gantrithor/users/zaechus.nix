{ lib, ... }:

{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical-home.nix
      ../../../modules/thinkpad-home.nix
    ];

    programs.alacritty.settings.font.size = lib.mkOverride 0 10.0;
  };
}
