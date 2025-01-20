{
  imports = [
    (import ../../../modules/dev/rust { username = "zaechus"; })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ../../../users/zaechus/home.nix
      ../../../modules/home.nix
      ../../../themes/gruvbox/home.nix
      ../../../modules/graphical/home.nix

      ../../../modules/zellij/home.nix
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

    home.stateVersion = "24.05";
  };
}
