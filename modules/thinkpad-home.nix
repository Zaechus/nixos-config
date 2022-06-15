# A superset of the laptop configuration, the thinkpad-home module additionally
# disables the touchpad in sway by default, due to the existence of the TrackPoint
# on Thinkpad laptops.

{
  imports = [
    ./laptop-home.nix
  ];

  wayland.windowManager.sway.config.input = {
    # match on old and new TrackPoint names
    # flat good adaptive trash
    "2:10:TPPS/2_IBM_TrackPoint" = {
      pointer_accel = "1";
      accel_profile = "flat";
    };
    "2:10:TPPS/2_Elan_TrackPoint" = {
      pointer_accel = "1";
      accel_profile = "flat";
    };
    # disable the touchpad by default since I use the TrackPoint on Thinkpads
    "type:touchpad".events = "disabled";
  };
}
