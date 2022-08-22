{
  programs.starship.enable = true;

  starship.init = ''
    mkdir ~/.cache/starship
    starship init nu | save ~/.cache/starship/init.nu
  '';
  starship.source = "source ~/.cache/starship/init.nu";
}
