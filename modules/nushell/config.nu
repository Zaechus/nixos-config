let-env config = {
  show_banner: false
  edit_mode: vi
}

# aliases
alias doas = sudo

alias diff = diff --color
alias exa = exa --icons --color always
alias ip = ip -c

alias l = ls
alias la = l -a
alias lal = l -al
alias ll = l -l
alias lt = exa --git-ignore -T
alias lta = exa -aT
alias lx = exa

alias pp = ping 1.1.1.1
alias sc2cfg = (swaymsg input type:keyboard repeat_rate 88; swaymsg input type:keyboard repeat_delay 150)
alias x = xdg-open

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
