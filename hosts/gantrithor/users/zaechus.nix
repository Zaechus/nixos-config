{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../modules/desktop-home.nix
      ../../../modules/thinkpad-home.nix
    ];

    wayland.windowManager.sway.config.output = {
      LVDS-1 = { bg = "${../../../modules/sway/background.jpg} fill"; };
    };
  };
}
