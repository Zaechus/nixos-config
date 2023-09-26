{
  imports = [
    ../../../users/zaechus
  ];

  # they finally fixed it
  # services.getty.autologinUser = "zaechus";

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical/home.nix
      ../../../modules/laptop/thinkpad.nix
      ../../../modules/dev/home.nix
      ../../../modules/dev/rust
      ../../../modules/games/dosbox

      ../../../modules/tiny
    ];

    wayland.windowManager.sway.config.output.eDP-1.subpixel = "rgb";

    home.stateVersion = "21.11";
  };
}
