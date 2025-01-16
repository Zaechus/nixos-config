{
  imports = [
    ../../../users/zaechus
  ];

  home-manager.users.zaechus = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/gruvbox
      ../../../modules/graphical/home.nix
    ];

    wayland.windowManager.sway.config.window.titlebar = false; # TODO: just get rid of home-manager....

    home.stateVersion = "24.05";
  };
}
