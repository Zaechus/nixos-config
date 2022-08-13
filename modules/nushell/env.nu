let-env EDITOR = "hx"
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"
let-env PAGER = "bat"

# inits
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

mkdir ~/.cache/zoxide
zoxide init nushell --hook prompt | save ~/.cache/zoxide/init.nu
