{ lib, ... }:

let
  username = "lizzie";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../common/users/themes/tokyonight { inherit username; })
    (import ../../../common/users/graphical { inherit username; })
  ];

  users.users.lizzie = {
    isNormalUser = true;

    files.".config/nushell/login.nu".text = lib.mkForce "if (tty) =~ '/dev/tty' { exec sway }";
  };
}
