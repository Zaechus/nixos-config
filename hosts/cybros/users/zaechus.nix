{
  imports = [
    ../../../users/zaechus
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical/home.nix
      ../../../modules/laptop/thinkpad
      ../../../modules/dev/home.nix
      ../../../modules/dev/rust
      ../../../modules/games/dosbox
      ../../../modules/games/nethack

      ../../../modules/tiny
      ../../../modules/games/doomrl
      ../../../modules/games/dwarf-fortress
    ];

    wayland.windowManager.sway.config.output = {
      eDP-1 = {
        pos = "0 0";
        subpixel = "rgb";
      };
      DP-1 = {
        pos = "1920 0";
      };
    };

    home.stateVersion = "21.11";
  };
}
