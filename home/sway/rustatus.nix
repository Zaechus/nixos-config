{ config, pkgs, ... }:

{
  wayland.windowManager.sway.config.bars = [{
    position = "top";
    statusCommand = "${pkgs.my.rustatus}/bin/rustatus";
    fonts = {
      names = [ config.fonts.monospace ];
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
