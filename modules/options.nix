{ lib, ... }:

with lib;

{
  options = {
    fonts.monospace = mkOption { type = types.str; default = "monospace"; };
    vivid.theme = mkOption { type = types.str; default = ""; }; # LS_COLORS
  };
}
