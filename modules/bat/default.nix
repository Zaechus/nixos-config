{ lib, pkgs, ... }:

let
  userOptions = { config, ... }: {
    options.programs.bat = {
      enable = lib.mkEnableOption "bat";
      settings = lib.mkOption {
        type = with lib.types; attrsOf str;
        default = { };
      };
    };
    config = let cfg = config.programs.bat; in {
      packages = lib.mkIf cfg.enable [ pkgs.bat ];
      files.".config/bat/config" = lib.mkIf (cfg.enable && cfg.settings != { }) {
        text = lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "--${k}=${v}") cfg.settings);
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
