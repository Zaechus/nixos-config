{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
  };
}
