{ lib, pkgs, ... }:

let
  userOptions = { config, ... }: {
    options.programs.nushell = {
      enable = lib.mkEnableOption "Nushell";
      configText = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      envText = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
    config = let cfg = config.programs.nushell; in {
      packages = lib.mkIf cfg.enable [ pkgs.nushell ];
      files.".config/nushell/config.nu" = lib.mkIf (cfg.enable && cfg.configText != "") {
        text = cfg.configText;
      };
      files.".config/nushell/env.nu" = lib.mkIf (cfg.enable && cfg.envText != "") {
        text = cfg.envText;
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
