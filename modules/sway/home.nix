{ config, ... }:

{
  imports = [
    ./rustatus.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    systemd.enable = true;
    xwayland = true;
    config = {
      defaultWorkspace = "workspace number 1";

      focus.followMouse = "no";
      focus.wrapping = "force";
      gaps.smartBorders = "on";

      input."type:keyboard" = {
        repeat_delay = "300";
        repeat_rate = "25";
      };

      input."type:pointer" = {
        accel_profile = "flat";
      };

      output."*".bg = "${../../assets/background.jpg} fill";

      # seat."*" = {
      #   hide_cursor = "when-typing enable";
      # };

      menu = with config.theme; ''
        bemenu-run --fn 'Fira Code 14' \
          --tb \${bg} \
          --fb \${bg} \
          --nb \${bg} \
          --hb \${bg} \
          --sb \${bg} \
          --ab \${bg} \
          --tf \${secondary} \
          --hf \${secondary} \
          --nf \${fg}
      '';

      modifier = "Mod4";
      floating.modifier = "Mod4";
      left = "h";
      down = "j";
      up = "k";
      right = "l";

      keybindings = with config.wayland.windowManager.sway.config;
        let
          mod = modifier;
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

          "${mod}+z" = "focus output left";
          "${mod}+x" = "focus output right";

          "${mod}+Shift+z" = "move output left";
          "${mod}+Shift+x" = "move output right";

          "${mod}+Tab" = "move workspace to output right";
          "${mod}+Shift+Tab" = "move workspace to output left";

          "Print" = "exec grim";
          "${mod}+Print" = "exec grim - | wl-copy";
          "${mod}+g" = ''exec grim -g "$(slurp)" - | wl-copy'';

          "${mod}+Shift+s" = "exec swaylock -c 000000";

          "${mod}+t" = "input type:touchpad events disabled";
          "${mod}+Shift+t" = "input type:touchpad events enabled";

          "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
          "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
          "XF86AudioMute" = "exec amixer set Master toggle";
          "XF86AudioMicMute" = "exec 'amixer set Capture toggle && amixer -c 1 set Capture nocap'";

          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+n" = "split none";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+a" = "focus parent";
          "${mod}+c" = "focus child";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          "${mod}+r" = ''mode "resize"'';
        };
      modes.resize = with config.wayland.windowManager.sway.config; {
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
        names = [ "Fira Code" ];
        size = 9.0;
      };

      # window colors
      colors = with config.theme; {
        focused = {
          background = primary;
          border = primary;
          childBorder = primary;
          indicator = primary;
          text = fg0;
        };
        focusedInactive = {
          background = bg1;
          border = bg1;
          childBorder = bg1;
          indicator = bg1;
          text = fg;
        };
        unfocused = {
          background = bg;
          border = bg;
          childBorder = bg;
          indicator = bg;
          text = fg;
        };
      };

      assigns = {
        "2" = [
          { title = "Hollow Knight"; }
          { title = "StarCraft II"; }
          { title = "WineDesktop - Wine desktop"; }
          { title = "World of Warcraft"; }
        ];
        "4" = [
          { app_id = "lutris"; }
          { title = "Battle.net"; }
          { title = "Wine System Tray"; }
        ];
      };
    };
  };

  home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";

  nu.startup = "if (tty) =~ '/dev/tty1' { exec sway }";

  programs.zsh.profileExtra = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
    fi
  '';
}
