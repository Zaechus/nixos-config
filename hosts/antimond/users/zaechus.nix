{
  imports = [
    ../../../users/zaechus
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical/home.nix

      ../../../modules/dev/rust
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
