{ config, options, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    wrapperFeatures.gtk = true;
    config = {
      defaultWorkspace = "workspace number 1";

      focus.forceWrapping = true;

      gaps.smartBorders = "on";

      output = {
        "*" = { bg = "${../../assets/background.jpg} fill"; };
      };

      menu = ''
        bemenu-run --fn 'FiraCode 12' \
          --tb \${config.theme.bg} \
          --fb \${config.theme.bg} \
          --nb \${config.theme.bg} \
          --hb \${config.theme.bg} \
          --sb \${config.theme.bg} \
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

      keybindings =
        let mod = config.wayland.windowManager.sway.config.modifier;
            left = config.wayland.windowManager.sway.config.left;
            down = config.wayland.windowManager.sway.config.down;
            up = config.wayland.windowManager.sway.config.up;
            right = config.wayland.windowManager.sway.config.right;
        in {
        "${mod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "${mod}+d" = "exec ${config.wayland.windowManager.sway.config.menu}";

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

        "${mod}+Print" = "exec grim - | wl-copy";
        "${mod}+Shift+g" = ''exec grim -g "$(slurp)" - | wl-copy'';

        "${mod}+Shift+s" = "exec swaylock -c 000000";

        "${mod}+t" = "input type:touchpad events disabled";
        "${mod}+Shift+t" = "input type:touchpad events enabled";

        "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
        "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
        "XF86AudioMute" = "exec amixer set Master toggle";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        "${mod}+a" = "focus parent";

        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        "${mod}+r" = ''mode "resize"'';

        "${mod}+y" = "exec sudo cpufreq powersave";
        "${mod}+u" = "exec sudo cpufreq conservative";
        "${mod}+i" = "exec sudo cpufreq schedutil";
        "${mod}+o" = "exec sudo cpufreq ondemand";
        "${mod}+p" = "exec sudo cpufreq performance";

        "${mod}+n" = "exec ${config.wayland.windowManager.sway.config.terminal} -e sh -c 'sleep .02 && nvim'";
      };
      modes = { resize = {
        "Left" = "resize shrink width 10px";
        "Down" = "resize grow height 10px";
        "Up" = "resize shrink height 10px";
        "Right" = "resize grow width 10px";

        "Return" = ''mode "default"'';
        "Escape" = ''mode "default"'';
      };};

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

  programs.i3status-rust = {
    enable = true;
    bars.top = {
      blocks = [
        { block = "disk_space"; }
        { block = "cpu"; icons_format = ""; }
        { block = "temperature"; format = "{max}"; }
        { block = "memory"; format_mem = "{mem_used}"; format_swap = "{swap_used}"; }
        { block = "battery"; format = " {percentage}"; }
        { block = "time"; }
      ];
      icons = "awesome5";
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "sway";
  };

  home.shellAliases = {
    sc2cfg = "swaymsg input type:keyboard repeat_rate 150 && swaymsg input type:keyboard repeat_delay 150";
    unsc2 = "swaymsg input type:keyboard repeat_rate 25 && swaymsg input type:keyboard repeat_delay 300";
  };

  programs.nushell.settings.startup = [ ''if (tty) =~ "/dev/tty1" { exec sway } {}'' ];

  programs.zsh = {
    profileExtra = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';
  };
}
