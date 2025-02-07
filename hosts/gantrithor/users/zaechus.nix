{ lib, ... }:

let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../common/users/themes/tokyonight { inherit username; })
    (import ../../../common/users/graphical { inherit username; })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    programs.git.config.user = {
      email = "zaechus@pm.me";
      name = "Zaechus";
    };

    programs.alacritty.settings.font.size = lib.mkForce 10.0;
    programs.sway.config.input."type:touchpad".events = lib.mkForce "disabled";
  };
}
