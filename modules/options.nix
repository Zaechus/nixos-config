{ lib, ... }:

with lib;

{
  options = {
    fonts = {
      monospace = mkOption { type = types.str; default = "Fira Code"; };
    };
    nu = {
      # set an env var for LS_COLORS with vivid
      LS_COLORS = mkOption { type = types.str; default = ""; };
    };
  };
}
