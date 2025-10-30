$env.config = {
  show_banner: false
  edit_mode: vi
  ls: {
    clickable_links: false
  }
  display_errors: {
    exit_code: false
    termination_signal: false # do not show error on SIGINT
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

alias lx = eza --color=always
alias lxa = lx -a
alias lxl = lx -l
alias lxal = lx -aalg
def --wrapped lt [...args: string] {
  lx -T ...$args | bat -p
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
  --unfree
  ...packages: string # packages to include
] {
  if ($unfree) {
    NIXPKGS_ALLOW_UNFREE=1 nix shell --impure ...($packages | each { |p| $'nixpkgs#($p)' })
  } else {
    nix shell ...($packages | each { |p| $'nixpkgs#($p)' })
  }
}

def "nix dev" [
  shell: string
  -c: string
] {
  let flake_path = ls -l /etc/nixos/flake.nix | get 0.target | path dirname

  if $c == null {
    nix develop $'($flake_path)#($shell)' -c nu
  } else {
    nix develop $'($flake_path)#($shell)' -c nu -c $c
  }
}

def "nix try" [file?: string] {
  if $file == null {
    NIXPKGS_ALLOW_UNFREE=1 nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
  } else {
    NIXPKGS_ALLOW_UNFREE=1 nix-build -E $'with import <nixpkgs> { }; callPackage ($file) { }'
  }
}

def sc2cfg [] {
  swaymsg input type:keyboard repeat_rate 88
  swaymsg input type:keyboard repeat_delay 150
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

def doomrl [
  --install
] {
  if $install {
    http get https://drl.chaosforge.org/file_download/32/doomrl-linux-x64-0997.tar.gz& | save -p ~/Games/doomrl-linux-x64-0997.tar.gz
    tar -xf ~/Games/doomrl-linux-x64-0997.tar.gz -C ~/Games
    open -r ~/.config/doomrl/config.lua | save -f ~/Games/doomrl-linux-x64-0997/config.lua
    open -r ~/.config/doomrl/keybindings.lua | save -f ~/Games/doomrl-linux-x64-0997/keybindings.lua
  } else {
    cd ~/Games/doomrl-linux-x64-0997
    TERM=xterm steam-run ./doomrl -console
  }
}

def --wrapped dwarf-fortress [...args: string] {
  alacritty msg config 'font.normal.family = "DejaVu Sans Mono"'
  alacritty msg config draw_bold_text_with_bright_colors=true
  ^dwarf-fortress
  alacritty msg config draw_bold_text_with_bright_colors=false
  alacritty msg config 'font.normal.family = "monospace"'
}
