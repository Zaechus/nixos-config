{ username, ... }: { config, lib, pkgs, ... }:

let
  cfg = config.programs.helix;
  settingsFormat = pkgs.formats.toml { };
in
{
  options = {
    programs.helix = {
      enable = lib.mkEnableOption "helix";
      settings = lib.mkOption {
        type = settingsFormat.type;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ helix ];
    files."/home/${username}/.config/helix/config.toml" = lib.mkIf (cfg.settings != [ ]) {
      source = settingsFormat.generate "helix-config" cfg.settings;
    };
  };
}
