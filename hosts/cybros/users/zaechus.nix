let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../themes/gruvbox { inherit username; })
    (import ../../../common/users/graphical { inherit username; })
    (import ../../../common/users/dev/rust { inherit username; })
    (import ../../../common/users/dev/zellij { inherit username; })
    (import ../../../common/users/games/dosbox { inherit username; })
    (import ../../../common/users/games/nethack { inherit username; })

    (import ../../../common/users/git {
      inherit username;
      email = "zaechus@pm.me";
      name = "Zaechus";
    })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    programs.sway.config = {
      input."type:touchpad".events = "disabled";
      output = {
        eDP-1 = {
          pos = "0 0";
          subpixel = "rgb";
        };
        DP-1 = {
          pos = "1920 0";
        };
      };
      terminal = "alacritty msg create-window || alacritty";
    };
  };
}
