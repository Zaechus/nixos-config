{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
  ];

  programs.bottom.settings.flags.battery = true;

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
