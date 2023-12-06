{ lib, ... }:

{
  imports = [
    ../../../users/lizzie
  ];

  home-manager.users.lizzie = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/tokyonight
      ../../../modules/laptop/home.nix
      ../../../modules/graphical/home.nix
    ];

    programs.nushell.loginFile.text = lib.mkOverride 0 "if (tty) =~ '/dev/tty' { exec sway }";

    home.stateVersion = "21.11";
  };
}
