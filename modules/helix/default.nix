{ lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = { config, ... }: {
    options.programs.helix = {
      enable = lib.mkEnableOption "helix";
      settings = lib.mkOption {
        type = settingsFormat.type;
        default = { };
      };
    };
    config = let cfg = config.programs.helix; in {
      packages = lib.mkIf cfg.enable [ pkgs.helix ];
      files.".config/helix/config.toml" = lib.mkIf (cfg.enable && cfg.settings != { }) {
        source = settingsFormat.generate "helix-config" cfg.settings;
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
