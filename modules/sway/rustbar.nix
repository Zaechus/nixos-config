{ config, ... }:

{
  wayland.windowManager.sway.config.bars = [{
    position = "top";
    statusCommand = "~/code/rustbar/target/release/rustbar";
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
