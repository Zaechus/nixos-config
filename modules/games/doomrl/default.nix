{
  programs.nushell.extraConfig = ''
    def doomrl [
      --install
    ] {
      if $install {
        echo TODO
      } else {
        cd ~/Games/doomrl-linux-x64-0997
        TERM=xterm steam-run ./doomrl -console
      }
    }
  '';
}
