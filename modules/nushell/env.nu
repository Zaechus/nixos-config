def create_left_prompt [] {
  $"\n(ansi blue_bold)($env.PWD | str replace /home/zaechus ~)(ansi reset)(ansi green_bold)\n〉"
}

let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = {''}

let-env PROMPT_INDICATOR = { "" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { ") " }
# let-env PROMPT_MULTILINE_INDICATOR = { "::: " }
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"

let-env PATH = ($env.PATH | split row ':') # convert PATH to table
let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
