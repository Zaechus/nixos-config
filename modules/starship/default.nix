{
  programs.starship.enable = true;

  starship.init = ''
    mkdir ~/.cache/starship
    starship init nu | save ~/.cache/starship/init.nu
    sed -i 's/term size -c | get columns/(term size).columns/g' ~/.cache/starship/init.nu
  '';
  starship.source = ''
    let-env PROMPT_INDICATOR_VI_INSERT = ": "
    let-env PROMPT_INDICATOR_VI_NORMAL = ") "
    source ~/.cache/starship/init.nu
  '';
}
