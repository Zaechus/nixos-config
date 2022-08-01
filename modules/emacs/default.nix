{ pkgs, ... }:

{
  home.sessionPath = [ "$HOME/.emacs.d/bin" ];

  home.shellAliases.emacsnw = "TERM=xterm-256color emacs -nw";

  programs.emacs.enable = true;
}
