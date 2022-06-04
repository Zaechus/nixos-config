{ lib, ... }:

{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical-home.nix
      ../../../modules/thinkpad-home.nix
      ../../../modules/dev/home.nix
      ../../../modules/dev/rust/home.nix

      ../../../modules/nushell
      ../../../modules/tmux
      ../../../modules/qutebrowser
      ../../../modules/helix
    ];

    wayland.windowManager.sway.config.output.eDP-1.subpixel = "rgb";
  };
}
