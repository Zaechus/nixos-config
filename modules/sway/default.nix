{ config, ... }:

{
  wayland.windowManager.sway =
    let tnBg = "#24283b";
        tnFg = "#c0caf5";
        tnBlue = "#4770c4";
        tnBlueFg = "#7aa2f7";
        tnBlack = "#1D202F";
        gray = "#5c5c5c";
  in {
    enable = true;
    config = {
      output = {
        eDP-1 = { bg = "${./background.jpg} fill"; };
      };

      defaultWorkspace = "workspace number 1";

      focus.forceWrapping = true;

      gaps.smartBorders = "on";

      menu = ''
        bemenu-run --fn 'FiraCode 12' --tb \${tnBg} --fb \${tnBg} --nb \${tnBg} --hb \${tnBg} --sb \${tnBg} --tf \${tnBlueFg} --hf \${tnBlueFg} --nf \${tnFg}
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

        "XF86MonBrightnessUp" = "exec light -A 5";
        "XF86MonBrightnessDown" = "exec light -U 5";

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
        names = [ "FiraCode" ];
        #style = "Retina";
        size = 9.0;
      };

      bars = [{
        position = "top";
        statusCommand = "while sh ${./status.sh}; do sleep 1; done";
        fonts = {
          names = [ "FiraCode" ];
          #style = "Retina";
          size = 10.0;
        };
        colors = {
          statusline = "${tnFg}";
          background = "${tnBg}";
          focusedWorkspace = {
            background = "${tnBlue}";
            border = "${tnBlue}";
            text = "#ffffff";
          };
          inactiveWorkspace = {
            background = "${tnBg}";
            border = "${tnBg}";
            text = "${gray}";
          };
        };
      }];
      colors = {
        focused = {
          background = "${tnBlue}";
          border = "${tnBlue}";
          childBorder = "${tnBlue}";
          indicator = "${tnBlue}";
          text = "#ffffff";
        };
        unfocused = {
          background = "${tnBlack}";
          border = "${tnBlack}";
          childBorder = "${tnBlack}";
          indicator = "${tnBlack}";
          text = "${gray}";
        };
      };

      startup = [
        { command = "swaymsg input type:touchpad events disabled"; }
        #{ command = "exec sudo cpufreq schedutil"; }
        #{ command = "exec screen -S weechat -d -m weechat"; }
      ];
    };
  };
}
