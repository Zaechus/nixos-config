let-env PATH = ($env.PATH | split row ':') # convert PATH to table
let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
