{ config, lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = {
    options.programs.alacritty = {
      enable = lib.mkEnableOption "Alacritty";
      settings = lib.mkOption {
        type = settingsFormat.type;
      };
    };
  };
in
{
  options = {
    users.users = lib.mkOption {
      type = with lib.types; attrsOf (submodule userOptions);
    };
  };

  config = lib.mkMerge [
    {
      environment.systemPackages = lib.mkIf (lib.any (user: user.programs.alacritty.enable) (lib.attrValues config.users.users)) [ pkgs.alacritty ];
    }
    {
      files = lib.mapAttrs'
        (name: user:
          lib.nameValuePair "/home/${user.name}/.config/alacritty/alacritty.toml" {
            source = settingsFormat.generate "alacritty.toml" user.programs.alacritty.settings;
          }
        )
        (lib.filterAttrs (name: user: user.programs.alacritty.enable && user.programs.alacritty.settings != { }) config.users.users);
    }
  ];
}
