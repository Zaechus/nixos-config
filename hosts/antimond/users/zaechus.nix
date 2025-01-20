let
  username = "zaechus";
in
{
  imports = [
    (import ../../../modules/dev/rust { inherit username; })
    (import ../../../modules/git {
      inherit username;
      email = "zaechus@pm.me";
      name = "Zaechus";
    })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox/home.nix
      ../../../modules/graphical/home.nix
    ];

    wayland.windowManager.sway.config = {
      output = {
        eDP-2 = {
          pos = "0 0";
          subpixel = "rgb";
        };
        DP-4 = {
          pos = "2560 0";
        };
      };
      window.titlebar = false; # TODO: just get rid of home-manager....
    };

    home = {
      homeDirectory = "/home/zaechus";
      username = "zaechus";
    };

    home.stateVersion = "24.05";
  };
}
