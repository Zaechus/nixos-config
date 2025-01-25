{ config, lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = {
    options.programs.helix = {
      enable = lib.mkEnableOption "helix";
      settings = lib.mkOption {
        type = settingsFormat.type;
        default = { };
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
      environment.systemPackages = lib.mkIf (lib.any (user: user.programs.helix.enable) (lib.attrValues config.users.users)) [ pkgs.helix ];
    }
    {
      files = lib.mapAttrs'
        (name: user:
          lib.nameValuePair "/home/${user.name}/.config/helix/config.toml" {
            source = settingsFormat.generate "helix-config" user.programs.helix.settings;
          }
        )
        (lib.filterAttrs (name: user: user.programs.helix.enable && user.programs.helix.settings != { }) config.users.users);
    }
  ];
}
