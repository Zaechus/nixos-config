let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"

let-env PATH = ($env.PATH | split row ':') # convert PATH to table
let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
