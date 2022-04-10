# Extra packages/configuration for laptop devices which extra requirments such
# as brightness control and batteries

{ lib, ... }:

{
  home.shellAliases = {
    btm = lib.mkOverride 1 "btm -R --battery";
  };

  wayland.windowManager.sway.config.keybindings = {
    "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
    "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
  };
}
