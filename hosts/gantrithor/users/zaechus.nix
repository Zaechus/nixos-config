{ lib, ... }:

let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../common/users/themes/tokyonight { inherit username; })
    (import ../../../common/users/graphical { inherit username; })

    (import ../../../common/users/git {
      inherit username;
      email = "zaechus@pm.me";
      name = "Zaechus";
    })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    programs.alacritty.settings.font.size = lib.mkForce 10.0;
    programs.sway.config.input."type:touchpad".events = lib.mkForce "disabled";
  };
}
