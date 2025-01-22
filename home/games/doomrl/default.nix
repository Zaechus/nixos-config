{
  programs.nushell.extraConfig = ''
    def doomrl [
      --install
    ] {
      if $install {
        http get https://drl.chaosforge.org/file_download/32/doomrl-linux-x64-0997.tar.gz& | save ~/Games/doomrl-linux-x64-0997.tar.gz
        tar -xf ~/Games/doomrl-linux-x64-0997.tar.gz -C ~/Games
        open -r ~/.config/doomrl/config.lua | save -f ~/Games/doomrl-linux-x64-0997/config.lua
        open -r ~/.config/doomrl/keybindings.lua | save -f ~/Games/doomrl-linux-x64-0997/keybindings.lua
      } else {
        cd ~/Games/doomrl-linux-x64-0997
        TERM=xterm steam-run ./doomrl -console
      }
    }
  '';

  home.file.".config/doomrl/config.lua".source = ./config.lua;
  home.file.".config/doomrl/keybindings.lua".source = ./keybindings.lua;
}
