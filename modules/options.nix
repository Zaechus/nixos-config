{ lib, options, ... }:

with lib;

{
  options = {
    alias.btm = mkOption { type = types.str; default = "btm -R"; };

    bt = {
      enable = mkOption { type = types.bool; default = false; };
      mac = mkOption { type = types.str; default = ""; };
    };
  };
}
