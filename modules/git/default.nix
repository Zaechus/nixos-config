{ lib, ... }:

let
  userOptions = { config, ... }: {
    options.programs.git = {
      enable = lib.mkEnableOption "git";
      config = lib.mkOption {
        type = with lib.types; attrsOf (attrsOf anything);
        default = { };
      };
    };
    config = let cfg = config.programs.git; in {
      files.".config/git/config" = lib.mkIf (cfg.enable && cfg.config != { }) {
        text = lib.generators.toGitINI cfg.config;
      };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
