{
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "space";
    extraConfigBeforePlugins = ''
      set -g @tmux-gruvbox-statusbar-alpha 'true'
    '';
    extraConfig = ''
      set -g status-position top
      set -g status-right ""
    '';
  };
}
