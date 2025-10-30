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

    (import ../../../common/users/games { inherit username; })
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

    programs.sway.config.output = {
      eDP-1 = {
        pos = "0 0";
        subpixel = "rgb";
      };
      eDP-2 = {
        pos = "0 0";
        subpixel = "rgb";
      };
      DP-3.pos = "2560 0";
      DP-4.pos = "2560 0";
    };
  };
}
