{
  programs.zellij = {
    enable = true;

    settings = {
      pane_frames = false;
      default_layout = ./layout.yaml;

      keybinds = {
        unbind = [
          { Ctrl = "b"; } # no tmux mode
          { Ctrl = "h"; } # move
          { Ctrl = "n"; } # resize
          { Ctrl = "o"; } # session
          { Ctrl = "p"; } # pane
          { Ctrl = "s"; } # scroll
          { Ctrl = "q"; } # no quit
        ];
        normal = [
          { key = [{ Ctrl = "y"; }]; action = [{ SwitchToMode = "Move"; }]; }
          { key = [{ Ctrl = "b"; }]; action = [{ SwitchToMode = "Resize"; }]; }
          { key = [{ Ctrl = "q"; }]; action = [{ SwitchToMode = "Session"; }]; }
          { key = [{ Ctrl = "f"; }]; action = [{ SwitchToMode = "Pane"; }]; }
          { key = [{ Ctrl = "x"; }]; action = [{ SwitchToMode = "Scroll"; }]; }
        ];
        scroll = [
          { key = [{ Char = "i"; }]; action = [{ SwitchToMode = "Normal"; }]; }
        ];
        session = [
          { key = [{ Char = "x"; }]; action = [ "Quit" ]; }
        ];
      };
    };
  };
}
