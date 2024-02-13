{
  imports = [
    ../../../users/zaechus
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical/home.nix
      ../../../modules/laptop/thinkpad.nix
      ../../../modules/dev/home.nix
      ../../../modules/dev/rust
      ../../../modules/games/dosbox
      ../../../modules/games/nethack

      ../../../modules/tiny
    ];

    wayland.windowManager.sway.config.output.eDP-1.subpixel = "rgb";

    home.stateVersion = "21.11";
  };
}
