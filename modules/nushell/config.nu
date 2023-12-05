$env.config = {
  show_banner: false
  edit_mode: vi
  cursor_shape: {
    vi_insert: block
    vi_normal: block
    emacs: line
  }
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

alias innoextract = innoextract -gm

# Run nixpkgs binary without installing
def , [
  pkg: string # Nix package to run
  args: string = '' # argument list as a string
] {
  if ($args | is-empty) {
    nix run $'nixpkgs#($pkg)'
  } else {
    nix run $'nixpkgs#($pkg)' -- ($args | split row ' ')
  }
}

# Create a shell with a set of available temporary packages
def ,, [
  ...packages: string # packages to include
] {
  nix shell ($packages | each { |p| $"nixpkgs#($p)" })
}

def sc2cfg [] {
  swaymsg input type:keyboard repeat_rate 88
  swaymsg input type:keyboard repeat_delay 150
}
