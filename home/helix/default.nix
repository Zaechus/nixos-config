{
  programs.helix = {
    enable = true;
    settings.editor.color-modes = true;
  };

  programs.zellij.settings.scrollback_editor = "hx";

  home.sessionVariables.EDITOR = "hx";
}
