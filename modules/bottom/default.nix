{ config, lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = {
    options.programs.bottom = {
      enable = lib.mkEnableOption "bottom";
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
      environment.systemPackages = lib.mkIf (lib.any (user: user.programs.bottom.enable) (lib.attrValues config.users.users)) [ pkgs.bottom ];
    }
    {
      files = lib.mapAttrs'
        (name: user:
          lib.nameValuePair "/home/${user.name}/.config/bottom/bottom.toml" {
            source = settingsFormat.generate "bottom.toml" user.programs.bottom.settings;
          }
        )
        (lib.filterAttrs (name: user: user.programs.bottom.enable && user.programs.bottom.settings != { }) config.users.users);
    }
  ];
}
