{ pkgs, ... }:

{
  programs.zsh.initExtra = ''
    path+=("$HOME/.emacs.d/bin")
  '';

  home.shellAliases = {
    emacsnw = "TERM=xterm-256color emacs -nw";
  };

  programs.emacs = {
    enable = true;

    #extraPackages = with pkgs.emacsPackages; (epkgs: []);
  };
}
