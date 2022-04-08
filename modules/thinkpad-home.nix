# A superset of the laptop configuration, the thinkpad-home module additionally
# disables the touchpad in sway by default, due to the existence of the TrackPoint
# on Thinkpad laptops.

{
  imports = [
    ./laptop-home.nix
  ];

  wayland.windowManager.sway.config.input = {
    "type:touchpad" = { events = "disabled"; };
  };
}
