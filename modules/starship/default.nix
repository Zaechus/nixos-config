{
  programs.starship.enable = true;

  starship.init = ''
    mkdir ~/.cache/starship
    starship init nu | save ~/.cache/starship/init.nu
  '';
  starship.source = ''
    let-env PROMPT_INDICATOR_VI_INSERT = ": "
    let-env PROMPT_INDICATOR_VI_NORMAL = ") "
    source ~/.cache/starship/init.nu
  '';
}
