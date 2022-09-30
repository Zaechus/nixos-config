let-env config = {
  show_banner: false
  edit_mode: vi
}

# aliases
alias diff = diff --color
alias doas = sudo
alias exa = exa --icons --color=always
alias ip = ip -c
alias l = ls
alias la = ls -a
alias ll = ls -l
alias lal = ls -al
alias pp = ping 1.1.1.1

# Display file tree
def lt [
  dir: string = .
  -l: int
] {
  if $l != null {
    exa --git-ignore -TL $l $dir | bat -p
  } else {
    exa --git-ignore -T $dir | bat -p
  }
}

# Display file tree with hidden files
def lta [
  dir: string = .
  -l: int
] {
  if $l != null {
    exa -aTL $l $dir | bat -p
  } else {
    exa -aT $dir | bat -p
  }
}

# Run nixpkgs binary without installing
def , [
  pkg: string # Nix package to run
  args: string = "" # argument list as a string
] {
  nix run $"nixpkgs#($pkg)" -- ($args | split row ' ')
}

# Create a shell with a set of available temporary packages
def ,, [
  ...packages: string # packages to include
] {
  nix shell ($packages | each { |p| $"nixpkgs#($p)" })
}
