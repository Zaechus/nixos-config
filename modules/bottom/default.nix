{ username, ... }: { config, lib, pkgs, ... }:

let
  cfg = config.programs.bottom;
  settingsFormat = pkgs.formats.toml { };
in
{
  options = {
    programs.bottom = {
      enable = lib.mkEnableOption "bottom";
      settings = lib.mkOption {
        type = settingsFormat.type;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ bottom ];
    files."/home/${username}/.config/bottom/bottom.toml" = lib.mkIf (cfg.settings != [ ]) {
      source = settingsFormat.generate "bottom.toml" cfg.settings;
    };
  };
}
