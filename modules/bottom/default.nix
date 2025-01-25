{ lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = { config, ... }: {
    options.programs.bottom = {
      enable = lib.mkEnableOption "bottom";
      settings = lib.mkOption {
        type = settingsFormat.type;
        default = { };
      };
    };
    config = let cfg = config.programs.bottom; in {
      packages = lib.mkIf cfg.enable [ pkgs.bottom ];
      files.".config/bottom/bottom.toml" = lib.mkIf (cfg.enable && cfg.settings != { }) {
        source = settingsFormat.generate "bottom.toml" cfg.settings;
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
