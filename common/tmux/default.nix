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

      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -T copy-mode-vi i send-keys -X cancel
    '';
  };
}
