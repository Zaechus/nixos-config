{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../modules/graphical-home.nix
    ];

    wayland.windowManager.sway.config.output = {
      Virtual-1 = { bg = "${../../../modules/sway/background.jpg} fill"; };
    };
  };
}