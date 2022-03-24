{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      output = {
        eDP-1 = { bg = "./background.jpg fill"; };
      };
      floating.modifier = "Mod4";
      keybindings = {
        "Mod4+Return" = "exec alacritty";
        "Mod4+d" = "exec bemenu-run";

        "Mod4+Shift+q" = "kill";
        "Mod4+Shift+e" = "exec swaymsg exit";

        "Mod4+e" = "layout toggle split";
        "Mod4+w" = "layout tabbed";
        "Mod4+f" = "fullscreen";

        "Mod4+Up" = "focus up";
        "Mod4+Down" = "focus down";
        "Mod4+Left" = "focus left";
        "Mod4+Right" = "focus right";

        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Down" = "move down";
        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Right" = "move right";

        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";
        "Mod4+Shift+0" = "move container to workspace number 10";

        "Mod4+Print" = "exec grim - | wl-copy";
        "Mod4+Shift+g" = ''exec grim -g "$(slurp)" - | wl-copy'';

        "Mod4+Shift+s" = "exec swaylock -c 000000";

        "Mod4+t" = "input type:touchpad events disabled";
        "Mod4+Shift+t" = "input type:touchpad events enabled";

        "XF86MonBrightnessUp" = "exec light -A 5";
        "XF86MonBrightnessDown" = "exec light -U 5";

        "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
        "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
        "XF86AudioMute" = "exec amixer set Master toggle";

        #    bindsym $mod+b splith
        #    bindsym $mod+v splitv
        #
        #    bindsym $mod+s layout stacking
        #    bindsym $mod+w layout tabbed
        #    bindsym $mod+e layout toggle split
        #
        #    bindsym $mod+Shift+space floating toggle
        #
        #    bindsym $mod+space focus mode_toggle
        #
        #    bindsym $mod+a focus parent
        #
        #    bindsym $mod+Shift+minus move scratchpad
        #
        #    bindsym $mod+minus scratchpad show
        #
        #mode "resize" {
        #    bindsym Left resize shrink width 10px
        #    bindsym Down resize grow height 10px
        #    bindsym Up resize shrink height 10px
        #    bindsym Right resize grow width 10px
        #
        #    bindsym Return mode "default"
        #    bindsym Escape mode "default"
        #}
        #bindsym $mod+r mode "resize"

        #$mod+y exec sudo cpufreq powersave
        #$mod+u exec sudo cpufreq conservative
        #$mod+i exec sudo cpufreq schedutil
        #$mod+o exec sudo cpufreq ondemand
        #$mod+p exec sudo cpufreq performance
      };

      bars = [{
        position = "top";
        statusCommand = ''
          while echo $(echo "$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)  $(cat /sys/class/power_supply/BAT0/capacity)%  $(date +'%Y-%m-%d %H:%M:%S')"); do sleep 1; done
        '';
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
        # exec sudo cpufreq schedutil
        # exec screen -S weechat -d -m weechat
      ];
    };
  };
}
