# config.nu.LS_COLORS
let-env EDITOR = "hx"
let-env VISUAL = "hx"
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"
let-env PAGER = "bat -p"

let-env PATH = ($env.PATH | prepend '~/.cargo/bin')

# inits
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

mkdir ~/.cache/zoxide
zoxide init nushell --hook prompt | save ~/.cache/zoxide/init.nu
