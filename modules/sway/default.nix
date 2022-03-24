{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      output = {
        eDP-1 = { bg = "${./background.jpg} fill"; };
      };
      modifier = "Mod4";
      floating.modifier = "Mod4";
      keybindings =
        let mod = config.wayland.windowManager.sway.config.modifier;
        in {
        "${mod}+Return" = "exec alacritty";
        "${mod}+d" = "exec bemenu-run";

        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+e" = "exec swaymsg exit";

        "${mod}+f" = "fullscreen";
        "${mod}+e" = "layout toggle split";
        "${mod}+w" = "layout tabbed";
        "${mod}+s" = "layout stacking";

        "${mod}+Up" = "focus up";
        "${mod}+Down" = "focus down";
        "${mod}+Left" = "focus left";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Right" = "move right";

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

      bars = [{
        position = "top";
        statusCommand = "while sh ${./status.sh}; do sleep 1; done";
        colors = {
          statusline = "#ffffff";
          background = "#323232";
          inactiveWorkspace = {
            background = "#32323200";
            border = "#32323200";
            text = "#5c5c5c";
          };
        };
      }];

      startup = [
        #exec sudo cpufreq schedutil
        #exec screen -S weechat -d -m weechat
      ];
    };
  };
}
