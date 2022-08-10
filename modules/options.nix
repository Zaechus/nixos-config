{ lib, options, ... }:

with lib;

{
  options = {
    bt = {
      enable = mkOption { type = types.bool; default = false; };
      mac = mkOption { type = types.str; default = ""; };
    };
  };
}
