{ config, ... }:

{
  wayland.windowManager.sway.config.bars = [{
    position = "top";
    statusCommand = "~/code/rustbar/target/release/rustbar";
    fonts = {
      names = [ "FiraCode Nerd Font" ];
      size = 10.0;
    };
    colors = {
      statusline = config.theme.fg;
      background = config.theme.bg;
      focusedWorkspace = {
        background = config.theme.color;
        border = config.theme.color;
        text = "#ffffff";
      };
      inactiveWorkspace = {
        background = config.theme.bg;
        border = config.theme.bg;
        text = config.theme.fg;
      };
    };
  }];
}
