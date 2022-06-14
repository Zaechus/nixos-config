# A superset of the laptop configuration, the thinkpad-home module additionally
# disables the touchpad in sway by default, due to the existence of the TrackPoint
# on Thinkpad laptops.

{
  imports = [
    ./laptop-home.nix
  ];

  # disable the touchpad by default since I use the TrackPoint on Thinkpads
  wayland.windowManager.sway.config.input = {
    "2:10:TPPS/2_Elan_TrackPoint" = {
      pointer_accel = "1.0";
      accel_profile = "flat";
    };
    "type:touchpad" = { events = "disabled"; };
  };
}
