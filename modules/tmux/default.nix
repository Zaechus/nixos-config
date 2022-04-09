{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    #terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      gruvbox
    ];
  };
}
