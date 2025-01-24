{ lib, ... }:

# let
#   username = "lizzie";
# in
{
  # imports = [
  #   (import ../../../common/users { inherit username; })
  #   ../../../common/users/graphical
  # ];

  users.users.lizzie = {
    isNormalUser = true;
  };

  home-manager.users.lizzie = {
    imports = [
      ../../../themes/tokyonight/home.nix

      # ../../../home
      ../../../themes/theme.nix
      ../../../home/nushell
      ../../../home/starship

      ../../../home/sway
    ];

    programs.nushell.extraLogin = lib.mkOverride 0 "if (tty) =~ '/dev/tty' { exec sway }";

    home.stateVersion = "21.11";
  };
}
