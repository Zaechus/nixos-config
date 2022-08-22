let-env config = {
  edit_mode: vi
}

# aliases
alias diff = diff --color
alias doas = sudo
alias ip = ip -c
alias l = ls
alias la = ls -a
alias ll = ls -l
alias lal = ls -al
alias exa = exa --icons --color=always
alias pp = ping 1.1.1.1

# Display file tree
def lt [dir: string = ., level?: int] {
  if ($level == null) {
    exa -T $dir | bat -p
  } else {
    exa -TL $level $dir | bat -p
  }
}

# Display file tree with hidden files
def lta [dir: string = ., level?: int] {
  if ($level == null) {
    exa -aT $dir | bat -p
  } else {
    exa -aTL $level $dir | bat -p
  }
}

# Run nixpkgs binary without installing
def , [pkg: string, args: string = ""] {
  nix run $"nixpkgs#($pkg)" -- ($args | split row " ")
}
