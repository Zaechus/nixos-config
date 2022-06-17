# Extra packages/configuration for laptop devices which extra requirments such
# as brightness control and batteries

{ config, lib, ... }:

{
  alias.btm = "btm -R --battery";

  wayland.windowManager.sway.config = {
    keybindings = {
      "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
      "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
    };
    input."type:touchpad" = {
      pointer_accel = "0.4";
      natural_scroll = "enabled";
    };
  };
}
