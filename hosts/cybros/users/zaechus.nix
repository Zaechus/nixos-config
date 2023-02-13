{ lib, ... }:

{
  imports = [
    ../../../users/zaechus.nix
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
      ../../../modules/dev/rust/home.nix
      ../../../modules/games/dosbox

      ../../../modules/tiny
    ];

    bt = {
      enable = true;
      mac = "F4:0E:11:5E:16:14";
    };

    wayland.windowManager.sway.config.output.eDP-1.subpixel = "rgb";

    home.stateVersion = "21.11";
  };
}
