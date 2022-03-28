{
  home-manager.users.zaechus.wayland.windowManager.sway.config.output = {
    Virtual-1 = { bg = "${../../modules/sway/background.jpg} fill"; };
  };

  environment.sessionVariables = rec {
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}
