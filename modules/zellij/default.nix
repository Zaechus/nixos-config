{
  programs.zellij = {
    enable = true;

    settings = {
      pane_frames = false;
      default_layout = ./layout.yaml;
      keybinds.unbind = [
        { Ctrl = "b"; } # no tmux mode
        { Ctrl = "q"; } # no quit
      ];
    };
  };
}
