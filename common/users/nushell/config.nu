$env.config = {
  show_banner: false
  edit_mode: helix
  ls: {
    clickable_links: false
  }
  display_errors: {
    exit_code: false
    termination_signal: false # do not show error on SIGINT
  }
  cursor_shape: {
    emacs: line
    helix_insert: block
  }
}

# Run nixpkgs binary without installing
def --wrapped , [
  pkg: string # nix package to run
  ...args: string # arguments
] {
  NIXPKGS_ALLOW_UNFREE=1 nix run --impure $'nixpkgs#($pkg)' -- ...$args
}

# Create a shell with additional temporary packages
def ,, [
  ...pkgs: string # packages to include
] {
  NIXPKGS_ALLOW_UNFREE=1 nix shell --impure ...($pkgs| each { |p| $'nixpkgs#($p)' })
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

def doomrl [] {
  if not ('~/Games/doomrl-linux-x64-0997' | path exists) {
    if not ('~/Games/doomrl-linux-x64-0997.tar.gz' | path exists) {
      http get https://drl.chaosforge.org/file_download/32/doomrl-linux-x64-0997.tar.gz& | save -p ~/Games/doomrl-linux-x64-0997.tar.gz
    }
    tar -xf ~/Games/doomrl-linux-x64-0997.tar.gz -C ~/Games
    if ([~/.config/doomrl/config.lua, ~/.config/doomrl/keybindings.lua] | path exists | all {}) {
      open -r ~/.config/doomrl/config.lua | save -f ~/Games/doomrl-linux-x64-0997/config.lua
      open -r ~/.config/doomrl/keybindings.lua | save -f ~/Games/doomrl-linux-x64-0997/keybindings.lua
    }
  }
  cd ~/Games/doomrl-linux-x64-0997
  TERM=xterm steam-run ./doomrl -console
}

def --wrapped dwarf-fortress [...args: string] {
  alacritty msg config 'font.normal.family = "DejaVu Sans Mono"'
  alacritty msg config colors.draw_bold_text_with_bright_colors=true
  ^dwarf-fortress ...$args
  alacritty msg config colors.draw_bold_text_with_bright_colors=false
  alacritty msg config 'font.normal.family = "monospace"'
}

def --env fish_completions [] {
  if (which fish | length) > 0 {
    # https://www.nushell.sh/cookbook/external_completers.html#fish-completer
    let fish_completer = {|spans|
      fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
      | from tsv --flexible --noheaders --no-infer
      | rename value description
      | update value {|row|
        let value = $row.value
        let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
        if ($need_quote and ($value | path exists)) {
          let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
          $'"($expanded_path | str replace --all "\"" "\\\"")"'
        } else {$value}
      }
    }
    $env.config.completions.external.completer = $fish_completer
  }
}
