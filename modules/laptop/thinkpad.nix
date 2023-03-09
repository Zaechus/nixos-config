{
  imports = [
    ./home.nix
  ];

  wayland.windowManager.sway.config.input = {
    # adjust TrackPoint settings
    "type:pointer" = {
      pointer_accel = "0.63";
      accel_profile = "flat"; # flat good adaptive trash
    };
    # disable the touchpad by default
    "type:touchpad".events = "disabled";
  };
}
