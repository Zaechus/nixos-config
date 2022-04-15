{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";
    #terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
  };
}
