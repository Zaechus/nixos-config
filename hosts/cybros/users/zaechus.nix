{ lib, ... }:

let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../common/users/themes/gruvbox { inherit username; })
    (import ../../../common/users/graphical { inherit username; })
    (import ../../../common/users/dev/rust { inherit username; })
    (import ../../../common/users/dev/zellij { inherit username; })
    (import ../../../common/users/games/dosbox { inherit username; })
    (import ../../../common/users/games/nethack { inherit username; })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    programs.git.config.user = {
      email = "zaechus@pm.me";
      name = "Zaechus";
    };

    programs.sway.config = {
      input."type:touchpad".events = lib.mkForce "disabled";
      output = {
        eDP-1 = {
          pos = "0 0";
          subpixel = "rgb";
        };
        DP-1 = {
          pos = "1920 0";
        };
        HDMI-A-1 = {
          mode = "1920x1080@60Hz";
        };
      };
      terminal = "alacritty msg create-window || alacritty";
    };
  };
}
