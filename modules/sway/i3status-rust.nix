{ config, lib, ... }:

{
  # https://github.com/greshake/i3status-rust
  programs.i3status-rust = {
    enable = true;
    bars.top = {
      # https://greshake.github.io/i3status-rust/i3status_rs/blocks/index.html
      blocks = [
        (lib.mkIf config.bt.enable { block = "bluetooth"; inherit (config.bt) mac; format = " $icon {$percentage|} "; disconnected_format = " $available$icon "; })
        # TODO: fix net block; maybe file an issue for how broken it is
        { block = "net"; device = "(en|wl).*"; format = " $icon  "; format_alt = " $icon{ $ssid $signal_strength|}  "; missing_format = ""; }
        { block = "cpu"; format = " $utilization "; }
        { block = "temperature"; format = " $icon "; format_alt = " $icon $max "; }
        { block = "memory"; format = " $icon$mem_used.eng(p:Mi) "; format_alt = " $icon_swap $swap_used.eng(p:Mi) "; }
        { block = "battery"; format = " $icon  $percentage "; missing_format = ""; }
        { block = "time"; format = " $icon $timestamp.datetime(f:'%a %F %R') "; }
      ];
      icons = "awesome6";
      settings.theme.overrides.separator = "<span font='13.5'></span>";
    };
  };

  wayland.windowManager.sway.config.bars = [{
    position = "top";
    statusCommand = "i3status-rs ~/.config/i3status-rust/config-top.toml";
    fonts = {
      names = [ "FiraCode Nerd Font" ];
      size = 10.0;
    };
    colors = with config.theme; {
      statusline = fg;
      background = bg;
      focusedWorkspace = {
        background = primary;
        border = primary;
        text = fg0;
      };
      inactiveWorkspace = {
        background = bg;
        border = bg;
        text = fg;
      };
    };
  }];
}
