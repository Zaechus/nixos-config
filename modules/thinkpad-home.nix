{
  imports = [
    ./laptop-home.nix
  ];

  wayland.windowManager.sway.config.startup = [
    { command = "swaymsg input type:touchpad events disabled"; }
  ];
}
