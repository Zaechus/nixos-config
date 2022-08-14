{
  programs.zellij = {
    enable = true;

    settings = {
      pane_frames = false;
      default_layout = "disable-status-bar";
      keybinds.unbind = [ { Ctrl = "b"; } ];
    };
  };
}
