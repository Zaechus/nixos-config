{ lib, ... }:

let
  userOptions = { config, ... }: {
    options.programs.zellij.settings = lib.mkOption {
      type = with lib.types; attrsOf anything;
      default = { };
    };
  };
in
{
  options.users.users = lib.mkOption {
    type = with lib.types; attrsOf (submodule userOptions);
  };
}
