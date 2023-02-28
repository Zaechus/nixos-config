{ config, lib, options, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    systemdIntegration = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = {
      defaultWorkspace = "workspace number 1";

      focus.wrapping = "force";
      gaps.smartBorders = "on";
      window.hideEdgeBorders = "both";

      input."type:keyboard" = {
        repeat_delay = "300";
        repeat_rate = "25";
      };

      output."*".bg = "${../../assets/background.jpg} fill";

      menu = ''
        bemenu-run --fn 'FiraCode 14' \
          --tb \${config.theme.bg} \
          --fb \${config.theme.bg} \
          --nb \${config.theme.bg} \
          --hb \${config.theme.bg} \
          --sb \${config.theme.bg} \
          --ab \${config.theme.bg} \
          --tf \${config.theme.colorFg} \
          --hf \${config.theme.colorFg} \
          --nf \${config.theme.fg}
      '';
      terminal = "alacritty";

      modifier = "Mod4";
      floating.modifier = "Mod4";
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      keybindings = with config.wayland.windowManager.sway.config;
        let
          mod = modifier;
          inherit left;
          inherit down;
          inherit up;
          inherit right;
        in
        {
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+d" = "exec ${menu}";

          "${mod}+Shift+c" = "reload";

          "${mod}+Shift+q" = "kill";
          "${mod}+Shift+e" = "exec swaymsg exit";

          "${mod}+f" = "fullscreen";
          "${mod}+e" = "layout toggle split";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";
          "${mod}+${left}" = "focus left";
          "${mod}+${down}" = "focus down";
          "${mod}+${up}" = "focus up";
          "${mod}+${right}" = "focus right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";
          "${mod}+Shift+${left}" = "move left";
          "${mod}+Shift+${down}" = "move down";
          "${mod}+Shift+${up}" = "move up";
          "${mod}+Shift+${right}" = "move right";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+n" = "focus output left";
          "${mod}+m" = "focus output right";

          "${mod}+Shift+n" = "move output left";
          "${mod}+Shift+m" = "move output right";

          "${mod}+Tab" = "move workspace to output right";
          "${mod}+Shift+Tab" = "move workspace to output left";

          "${mod}+Print" = "exec grim - | wl-copy";
          "${mod}+g" = ''exec grim -g "$(slurp)" - | wl-copy'';
          "${mod}+Shift+g" = ''exec grim -g "$(slurp)"'';
          "${mod}+Shift+Print" = "exec grim";

          "${mod}+Shift+s" = "exec swaylock -c 000000";

          "${mod}+t" = "input type:touchpad events disabled";
          "${mod}+Shift+t" = "input type:touchpad events enabled";

          "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
          "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
          "XF86AudioMute" = "exec amixer set Master toggle";
          "XF86AudioMicMute" = "exec 'amixer set Capture toggle && amixer -c 1 set Capture nocap'";

          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+x" = "split none";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+a" = "focus parent";
          "${mod}+c" = "focus child";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          "${mod}+r" = ''mode "resize"'';
        };
      modes.resize = with config.wayland.windowManager.sway.config;
        let
          inherit left;
          inherit down;
          inherit up;
          inherit right;
        in
        {
          "Left" = "resize shrink width 10px";
          "Down" = "resize grow height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize grow width 10px";
          "${left}" = "resize shrink width 10px";
          "${down}" = "resize grow height 10px";
          "${up}" = "resize shrink height 10px";
          "${right}" = "resize grow width 10px";

          "Return" = ''mode "default"'';
          "Escape" = ''mode "default"'';
        };

      fonts = {
        names = [ "FiraCode Nerd Font" ];
        size = 9.0;
      };

      bars = [{
        position = "top";
        statusCommand = "i3status-rs ~/.config/i3status-rust/config-top.toml";
        fonts = {
          names = [ "FiraCode Nerd Font" ];
          size = 10.0;
        };
        # bar colors
        colors = {
          statusline = config.theme.fg;
          background = config.theme.bg;
          focusedWorkspace = {
            background = config.theme.color;
            border = config.theme.color;
            text = "#ffffff";
          };
          inactiveWorkspace = {
            background = config.theme.bg;
            border = config.theme.bg;
            text = config.theme.fg;
          };
        };
      }];
      # window colors
      colors = {
        focused = {
          background = config.theme.color;
          border = config.theme.color;
          childBorder = config.theme.color;
          indicator = config.theme.color;
          text = "#ffffff";
        };
        focusedInactive = {
          background = config.theme.bright.black;
          border = config.theme.bright.black;
          childBorder = config.theme.bright.black;
          indicator = config.theme.bright.black;
          text = config.theme.fg;
        };
        unfocused = {
          background = config.theme.black;
          border = config.theme.black;
          childBorder = config.theme.black;
          indicator = config.theme.black;
          text = config.theme.fg;
        };
      };
    };
  };

  # https://github.com/greshake/i3status-rust
  programs.i3status-rust = {
    enable = true;
    bars.top = {
      # https://github.com/greshake/i3status-rust/blob/master/doc/blocks.md
      blocks = [
        (lib.mkIf config.bt.enable { block = "bluetooth"; inherit (config.bt) mac; format_unavailable = "{label}"; })
        { block = "net"; format = "<span> </span>"; format_alt = "{ssid} {signal_strength}"; }
        { block = "cpu"; icons_format = " "; }
        { block = "temperature"; format = "{max}"; }
        { block = "memory"; format_mem = "{mem_used}"; format_swap = "{swap_used}"; }
        { block = "battery"; format = " {percentage}"; hide_missing = true; }
        { block = "time"; format = "%a %F %R"; }
      ];
      icons = "awesome5";
    };
  };

  home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";

  nu.startup = ''if (tty) =~ "/dev/tty1" { exec sway }'';

  programs.zsh.profileExtra = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
    fi
  '';
}
