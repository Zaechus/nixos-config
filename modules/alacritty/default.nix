{ username, ... }: { config, lib, pkgs, ... }:

let
  cfg = config.programs.alacritty;
  settingsFormat = pkgs.formats.toml { };
in
{
  options = {
    programs.alacritty = {
      enable = lib.mkEnableOption "Alacritty";
      settings = lib.mkOption {
        type = settingsFormat.type;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ alacritty ];
    files."/home/${username}/.config/alacritty/alacritty.toml" = lib.mkIf (cfg.settings != [ ]) {
      source = settingsFormat.generate "alacritty.toml" cfg.settings;
    };
  };
}
