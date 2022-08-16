let-env config = {
  edit_mode: vi
}

# aliases
alias diff = diff --color
alias doas = sudo
alias ip = ip -c
alias l = ls
alias la = ls -a
alias ll = ls -al
alias exa = exa --icons --color=always
alias pp = ping 1.1.1.1

# Display file tree
def lt [level: int = 2] {
  exa -TL $level | bat -p
}
def lta [level: int = 2] {
  exa -aTL $level | bat -p
}

# Run nixpkgs binary without installing
def , [pkg: string] {
  nix run $"nixpkgs#($pkg)"
}

# sources
source ~/.cache/zoxide/init.nu
source ~/.cache/starship/init.nu

# config.nu.startup
