{ lib, pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };
  userOptions = { config, ... }: {
    options.programs.alacritty = {
      enable = lib.mkEnableOption "Alacritty";
      settings = lib.mkOption {
        type = settingsFormat.type;
        default = { };
      };
    };
    config = let cfg = config.programs.alacritty; in {
      packages = lib.mkIf cfg.enable [ pkgs.alacritty ];
      files.".config/alacritty/alacritty.toml" = lib.mkIf (cfg.enable && cfg.settings != { }) {
        source = (settingsFormat.generate "alacritty.toml" cfg.settings);
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
