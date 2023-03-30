{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ zellij ];

  programs.zellij.settings = {
    default_layout = "layout";
    default_shell = lib.mkDefault "nu";
    pane_frames = false;
    scrollback_editor = lib.mkDefault "hx";
    simplified_ui = true;

    keybinds = ''
      	normal {
      		unbind "Ctrl h" "Ctrl n" "Ctrl o" "Ctrl p" "Ctrl s"
      		bind "Ctrl y" { SwitchToMode "Move"; }
      		bind "Ctrl b" { SwitchToMode "Resize"; }
      		bind "Ctrl q" { SwitchToMode "Session"; }
      		bind "Ctrl f" { SwitchToMode "Pane"; }
      		bind "Ctrl x" { SwitchToMode "Scroll"; }
      	}
      	scroll {
      		bind "i" { SwitchToMode "Normal"; }
      	}
      	session {
      		bind "Ctrl q" { "Detach"; }
      		bind "x" { "Quit"; }
      	}
    '';
  };

  home.file.".config/zellij/layouts/layout.kdl".source = ./layout.kdl;

  home.file.".config/zellij/config.kdl".text = with config.programs.zellij.settings; ''
    default_layout "${default_layout}"
    default_shell "${default_shell}"
    pane_frames ${if pane_frames then "true" else "false"}
    scrollback_editor "${scrollback_editor}"
    simplified_ui ${if simplified_ui then "true" else "false"}

    keybinds {
      ${keybinds}
    }

    theme "${theme}"
  '' + builtins.readFile ./themes.kdl;
}
