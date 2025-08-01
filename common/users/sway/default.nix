{ username, ... }: { pkgs, ... }:

{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu
      brightnessctl
      swayidle
      swaylock
      wf-recorder
      wl-clipboard
      grim # screenshot
      slurp # screenshot selection
      jq # parse outputs for screenshot
    ];
  };

  users.users.${username} = { config, ... }: {
    programs.sway = {
      enable = true;
      config = {
        focusFollowsMouse = "no";
        smartBorders = "on";

        input."type:keyboard" = {
          repeat_delay = "300";
          repeat_rate = "25";
        };

        input."type:pointer" = {
          accel_profile = "flat";
        };

        input."type:touchpad" = {
          events = "disabled_on_external_mouse";
          natural_scroll = "enabled";
          pointer_accel = "0.4";
        };

        # older thinkpads
        input."2:10:TPPS\/2_IBM_TrackPoint" = {
          pointer_accel = "0.63";
          accel_profile = "flat";
        };
        # newer thinkpads
        input."2:10:TPPS\/2_Elan_TrackPoint" = {
          pointer_accel = "0.63";
          accel_profile = "flat";
        };

        output."*".bg = "${../../../assets/background.jpg} fill";

        menu = with config.theme; ''
          bemenu-run --fn 'Iosevka Extended 14' \
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

        floatingModifier = "Mod4";

        keybindings = with config.programs.sway.config;
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

            "${mod}+Print" = "exec grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy";
            "${mod}+Shift+Print" = "exec grim";
            "${mod}+g" = ''exec grim -g "$(slurp)" - | wl-copy'';

            "${mod}+Shift+s" = "exec swaylock -c 000000";

            "${mod}+t" = "input type:touchpad events disabled";
            "${mod}+Shift+t" = "input type:touchpad events enabled";

            "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
            "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";

            "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

            "XF86Calculator" = "exec ${terminal}";

            "${mod}+b" = "splith";
            "${mod}+v" = "splitv";
            "${mod}+n" = "split none";

            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle";

            "${mod}+a" = "focus parent";
            "${mod}+c" = "focus child";

            "${mod}+Shift+minus" = "move scratchpad";
            "${mod}+minus" = "scratchpad show";

            "${mod}+p" = "bar mode toggle";

            "${mod}+r" = ''mode "resize"'';
          };
        modes.resize = with config.programs.sway.config; {
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

        font = {
          name = "Iosevka Extended";
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

        bars = [{
          position = "top";
          statusCommand = "${pkgs.my.rustatus}/bin/rustatus";
          font = {
            name = "Iosevka Extended";
            size = 10.0;
          };
          colors = with config.theme; {
            statusline = fg;
            background = bg;
            focusedWorkspace = {
              background = primary;
              border = primary;
              text = fg0;
            };
            inactiveWorkspace = {
              background = bg;
              border = bg;
              text = fg;
            };
          };
        }];

        extra = [
          ''assign [class="^steam_app.*"] 2''
          ''assign [app_id="lutris"] 4''
          ''assign [class="galaxyclient.exe"] 4''
          ''assign [class="^steam$"] 4''
          ''for_window [app_id="brave-nngceckbapebfimnlniiiahkandclblb-Default"] floating enable''
          ''for_window [class="battle.net.exe"] floating enable''
          ''for_window [class="galaxyclient.exe"] floating enable''
          ''for_window [class=".*"] inhibit_idle fullscreen''
          ''for_window [app_id=".*"] inhibit_idle fullscreen''
        ];

        startup = [
          ''
            swayidle -w timeout 300 'swaylock -fc 000000' \
              timeout 600 'swaymsg output "*" power off' \
                resume 'swaymsg output "*" power on' \
              before-sleep 'swaylock -fc 000000'
          ''
        ];
      };
    };

    files.".config/nushell/login.nu".text = "if (tty) =~ '/dev/tty1' { exec sway }";
  };

  # Enable Wayland support in chrome
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
}
