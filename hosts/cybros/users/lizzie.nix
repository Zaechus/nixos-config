{ lib, ... }:

{
  imports = [
    ../../../users/lizzie
  ];

  home-manager.users.lizzie = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/tokyonight
      ../../../modules/graphical/home.nix
    ];

    programs.nushell.extraLogin = lib.mkOverride 0 "if (tty) =~ '/dev/tty' { exec sway }";

    home.stateVersion = "21.11";
  };
}
