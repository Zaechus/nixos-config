{
  programs.zsh.initExtra = ''
    path+=("$HOME/.emacs.d/bin")
  '';

  programs.emacs.enable = true;
}
