{ lib, ... }:

{
  users.users.lizzie = {
    isNormalUser = true;
  };

  home-manager.users.lizzie = {
    imports = [
      ../../../home
      ../../../themes/tokyonight/home.nix
      ../../../home/graphical
    ];

    programs.nushell.extraLogin = lib.mkOverride 0 "if (tty) =~ '/dev/tty' { exec sway }";

    home.stateVersion = "21.11";
  };
}
