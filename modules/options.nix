{ lib, ... }:

with lib;

{
  options = {
    nu = {
      # set a nushell env var for LS_COLORS with vivid
      LS_COLORS = mkOption { type = types.str; default = ""; };
      startup = mkOption { type = types.str; default = ""; };
    };
  };
}
