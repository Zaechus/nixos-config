$env.config = {
  show_banner: false
  edit_mode: vi
  ls: {
    clickable_links: false
  }
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

alias scrcpy = scrcpy -KM --forward-all-clicks

# Run nixpkgs binary without installing
def --wrapped , [
  pkg: string # Nix package to run
  ...args: string # arguments
] {
  nix run $'nixpkgs#($pkg)' -- ...$args
}

# Create a shell with a set of available temporary packages
def ,, [
  ...packages: string # packages to include
] {
  nix shell ...($packages | each { |p| $'nixpkgs#($p)' })
}

def "nix dev" [
  shell: string
  -c: string
] {
  let flake_path = ls -l /etc/nixos/flake.nix | get 0.target | str replace '/flake.nix' ''

  if $c == null {
    nix develop $'($flake_path)#($shell)' -c nu
  } else {
    nix develop $'($flake_path)#($shell)' -c nu -c $c
  }
}

def "nix try" [] {
  nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
}

def sc2cfg [] {
  swaymsg input type:keyboard repeat_rate 88
  swaymsg input type:keyboard repeat_delay 150
}

def gogextract [file: string] {
  innoextract -gm -d ($file | str replace -ra '^setup_|\.exe$' '') $file
}

def gogclean [] {
  rm -r goggame-*.* DOSBOX __redist app commonappdata
}

def setup_quake [] {
  mv id1/PAK0.PAK id1/pak0.pak
  mv id1/PAK1.PAK id1/pak1.pak

  mkdir id1/music
  bchunk -w game.gog game.cue track
  mv *.wav id1/music
  rm track01.iso

  mkdir hipnotic/music
  bchunk -w gamea.gog game.cue track
  mv *.wav hipnotic/music
  rm track01.iso

  mkdir rogue/music
  bchunk -w gamed.gog gamed.cue track
  mv *.wav rogue/music
  rm track01.iso
}
