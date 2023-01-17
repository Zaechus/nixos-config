let-env config = {
  show_banner: false
  edit_mode: vi
  # cursor_shape: {
  #   vi_insert: block
  #   vi_normal: block
  #   emacs: line
  # }
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
  ]
}

# aliases
alias exa = exa --icons --color always

alias angband = angband -dpref=/etc/angband/customize -mgcu
alias cp = cp -i
alias mv = mv -i

alias l = ls
alias la = l -a
alias lal = l -al
alias ll = l -l
alias lt = exa --git-ignore -T
alias lta = exa -aT
alias lx = exa

alias sc2cfg = (swaymsg input type:keyboard repeat_rate 88; swaymsg input type:keyboard repeat_delay 150)

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
