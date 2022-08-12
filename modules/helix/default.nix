{
  programs.helix = {
    enable = true;
    # settings = {
    #   editor = {
    #     cursor-shape.insert = "bar";
    #   };
    # };
  };

  programs.zellij.settings.scrollback_editor = "hx";

  home.sessionVariables.EDITOR = "hx";
}
