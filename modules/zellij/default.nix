{ config, lib, pkgs, ... }:

{
  programs.zellij.settings = {
    default_layout = "layout";
    default_shell = lib.mkDefault "nu";
    pane_frames = false;
    scrollback_editor = lib.mkDefault "hx";
    simplified_ui = true;
  };

  home.packages = with pkgs; [ zellij ];

  home.file.".config/zellij/layouts/layout.kdl".source = ./layout.kdl;

  home.file.".config/zellij/config.kdl".text = with config.programs.zellij.settings; ''
    default_layout "${default_layout}"
    default_shell "${default_shell}"
    pane_frames ${if pane_frames then "true" else "false"}
    scrollback_editor "${scrollback_editor}"
    simplified_ui ${if simplified_ui then "true" else "false"}

    keybinds {
    	normal {
    		unbind "Ctrl b" "Ctrl h" "Ctrl n" "Ctrl o" "Ctrl p" "Ctrl s"
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
    }

    theme "${theme}"

    themes {
    	gruvbox {
    		fg 213 196 161
    		bg 40 40 40
    		black 60 56 54
    		red 204 36 29
    		green 152 151 26
    		yellow 215 153 33
    		blue 69 133 136
    		magenta 177 98 134
    		cyan 104 157 106
    		white 251 241 199
    		orange 214 93 14
    	}
    }
  '';
}
