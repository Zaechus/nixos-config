{
  imports = [
    ./home.nix
  ];

  wayland.windowManager.sway.config.input =
    let
      pointer_accel = "0.63";
      accel_profile = "flat"; # flat good adaptive trash
    in
    {
      # older thinkpads
      "2:10:TPPS\/2_IBM_TrackPoint" = {
        inherit pointer_accel accel_profile;
      };
      # newer thinkpads
      "2:10:TPPS\/2_Elan_TrackPoint" = {
        inherit pointer_accel accel_profile;
      };
      # disable the touchpad by default
      "type:touchpad".events = "disabled";
    };
}
