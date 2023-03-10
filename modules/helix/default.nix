{
  programs.helix = {
    enable = true;

    settings = {
      editor = {
        # bufferline = "multple";
        color-modes = true;
      };

      keys.normal."C-z" = "no_op";
    };
  };

  programs.zellij.settings.scrollback_editor = "hx";

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
