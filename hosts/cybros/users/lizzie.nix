# { lib, ... }:

let
  username = "lizzie";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    # (import ../../../themes/tokyonight { inherit username; })
  ];

  users.users.lizzie = {
    isNormalUser = true;

    # programs.nushell.login = lib.mkForce "if (tty) =~ '/dev/tty' { exec sway }"; # TODO
  };
}
