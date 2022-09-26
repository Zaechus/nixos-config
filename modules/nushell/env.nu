let-env EDITOR = "hx"
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"
let-env PAGER = "bat -p"
let-env VISUAL = "hx"

let-env PATH = ($env.PATH | split row ':') # convert PATH to table
let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
