{
  programs.zellij = {
    enable = true;

    settings = {
      simplified_ui = true;
      pane_frames = false;
      scrollback_editor = "$EDITOR";
    };
  };
}
