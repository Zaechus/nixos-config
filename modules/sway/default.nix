{ lib, pkgs, ... }:

with lib;

let
  barColorSetModule = types.submodule {
    options = {
      border = mkOption { type = types.str; };
      background = mkOption { type = types.str; };
      text = mkOption { type = types.str; };
    };
  };
  barModule = types.submodule {
    options = {
      font = {
        name = mkOption {
          type = types.str;
          default = "monospace";
        };
        size = mkOption {
          type = types.float;
          default = 10.0;
        };
      };

      position = mkOption {
        type = types.enum [ "top" "bottom" ];
        default = "bottom";
      };

      statusCommand = mkOption {
        type = types.str;
        default = "${pkgs.my.rustatus}/bin/rustatus";
      };

      colors = {
        background = mkOption {
          type = types.nullOr types.str;
        };
        statusline = mkOption {
          type = types.nullOr types.str;
        };
        focusedWorkspace = mkOption {
          type = barColorSetModule;
          default = {
            border = "#333333";
            background = "#5f676a";
            text = "#ffffff";
          };
        };
        inactiveWorkspace = mkOption {
          type = barColorSetModule;
          default = {
            border = "#333333";
            background = "#222222";
            text = "#888888";
          };
        };
      };
    };
  };

  colorSetModule = types.submodule {
    options = {
      border = mkOption { type = types.str; };
      background = mkOption { type = types.str; };
      text = mkOption { type = types.str; };
      indicator = mkOption { type = types.str; };
      childBorder = mkOption { type = types.str; };
    };
  };

  modifierEnum = types.enum [ "Control" "Mod1" "Mod2" "Mod3" "Mod4" "Mod5" "Shift" ];

  configModule = types.submodule {
    options = {
      input = mkOption {
        type = types.attrsOf (types.attrsOf types.str);
        default = { };
      };
      output = mkOption {
        type = types.attrsOf (types.attrsOf types.str);
        default = { };
      };

      defaultBorder = mkOption {
        type = types.str;
        default = "pixel 2";
      };
      defaultFloatingBorder = mkOption {
        type = types.str;
        default = "normal 2";
      };

      focusFollowsMouse = mkOption {
        type = types.enum [ "yes" "no" "always" ];
        default = "yes";
      };

      focusWrapping = mkOption {
        type = types.enum [ "yes" "no" "force" "workspace" ];
        default = "yes";
      };

      smartBorders = mkOption {
        type = types.enum [ "on" "no_gaps" "off" ];
        default = "off";
      };

      floatingModifier = mkOption {
        type = types.nullOr modifierEnum;
      };

      modifier = mkOption {
        type = modifierEnum;
        default = "Mod4";
      };

      menu = mkOption {
        type = types.nullOr types.str;
        default = null;
      };

      terminal = mkOption {
        type = types.str;
        default = "${pkgs.alacritty}/bin/alacritty";
      };

      left = mkOption {
        type = types.str;
        default = "h";
      };
      down = mkOption {
        type = types.str;
        default = "j";
      };
      up = mkOption {
        type = types.str;
        default = "k";
      };
      right = mkOption {
        type = types.str;
        default = "l";
      };

      keybindings = mkOption {
        type = types.attrsOf types.str;
        default = { };
      };

      modes = mkOption {
        type = types.attrsOf (types.attrsOf types.str);
        default = { };
      };

      font = {
        name = mkOption {
          type = types.str;
          default = "monospace";
        };
        size = mkOption {
          type = types.float;
          default = 9.0;
        };
      };

      colors = {
        focused = mkOption {
          type = colorSetModule;
        };
        focusedInactive = mkOption {
          type = colorSetModule;
        };
        unfocused = mkOption {
          type = colorSetModule;
        };
      };

      bars = mkOption {
        type = types.listOf barModule;
        default = [ ];
      };

      startup = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };
    };
  };

  userOptions = { config, ... }: {
    options.programs.sway = {
      enable = mkEnableOption "Sway";
      config = mkOption {
        type = types.nullOr configModule;
        default = { };
      };
    };
    config = let cfg = config.programs.sway; in {
      files.".config/sway/config" = mkIf (cfg.enable && cfg.config != { }) {
        text = concatLines ([
          "font pango:${cfg.config.font.name} ${builtins.toString cfg.config.font.size}"
          (optionalString (cfg.config.floatingModifier != null)
            "floating_modifier ${cfg.config.floatingModifier}")
          "default_border ${cfg.config.defaultBorder}"
          "default_floating_border ${cfg.config.defaultFloatingBorder}"
          "focus_follows_mouse ${cfg.config.focusFollowsMouse}"
          "focus_wrapping ${cfg.config.focusWrapping}"
          "smart_borders ${cfg.config.smartBorders}"
          "client.focused ${cfg.config.colors.focused.border} ${cfg.config.colors.focused.background} ${cfg.config.colors.focused.text} ${cfg.config.colors.focused.indicator} ${cfg.config.colors.focused.childBorder}"
          "client.focused_inactive ${cfg.config.colors.focusedInactive.border} ${cfg.config.colors.focusedInactive.background} ${cfg.config.colors.focusedInactive.text} ${cfg.config.colors.focusedInactive.indicator} ${cfg.config.colors.focusedInactive.childBorder}"
          "client.unfocused ${cfg.config.colors.unfocused.border} ${cfg.config.colors.unfocused.background} ${cfg.config.colors.unfocused.text} ${cfg.config.colors.unfocused.indicator} ${cfg.config.colors.unfocused.childBorder}"
        ] ++ (mapAttrsToList
          (key: command:
            "bindsym ${key} ${command}"
          )
          cfg.config.keybindings)
        ++ (mapAttrsToList
          (mode: keybindings:
            concatLines (
              [ "mode \"${mode}\" {" ]
                ++ (mapAttrsToList
                (key: command:
                  "  bindsym ${key} ${command}"
                )
                keybindings)
                ++ [ "}" ]
            ))
          cfg.config.modes)
        ++ (mapAttrsToList
          (name: input:
            concatLines (
              [ "input \"${name}\" {" ]
                ++ (mapAttrsToList
                (setting: value:
                  "  ${setting} ${value}"
                )
                input)
                ++ [ "}" ]
            ))
          cfg.config.input)
        ++ (mapAttrsToList
          (name: output:
            concatLines (
              [ "output \"${name}\" {" ]
                ++ (mapAttrsToList
                (setting: value:
                  "  ${setting} ${value}"
                )
                output)
                ++ [ "}" ]
            ))
          cfg.config.output)
        ++ (map
          (bar: concatLines [
            "bar {"
            "  font pango:${bar.font.name} ${builtins.toString bar.font.size}"
            "  position ${bar.position}"
            "  status_command ${bar.statusCommand}"
            "  colors {"
            (optionalString (bar.colors.background != null)
              "    background ${bar.colors.background}")
            (optionalString (bar.colors.statusline != null)
              "    statusline ${bar.colors.statusline}")
            "    focused_workspace ${bar.colors.focusedWorkspace.border} ${bar.colors.focusedWorkspace.background} ${bar.colors.focusedWorkspace.text}"
            "    inactive_workspace ${bar.colors.inactiveWorkspace.border} ${bar.colors.inactiveWorkspace.background} ${bar.colors.inactiveWorkspace.text}"
            "  }"
            "}"
          ])
          cfg.config.bars)
        ++ (map
          (command:
            "exec ${command}"
          )
          cfg.config.startup));
      };
    };
  };
in
{
  options.users.users = mkOption {
    type = with types; attrsOf (submodule userOptions);
  };
}
