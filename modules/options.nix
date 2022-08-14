{ lib, options, ... }:

with lib;

{
  options = {
    # define an option for the bluetooth block of i3status-rust
    bt = {
      enable = mkOption { type = types.bool; default = false; };
      mac = mkOption { type = types.str; default = ""; };
    };
    nu = {
      # set a nushell env var for LS_COLORS with vivid
      LS_COLORS = mkOption {
        type = types.str;
        default = "let-env LS_COLORS = (vivid generate ayu | str trim)\n";
      };
      startup = mkOption { type = types.str; default = ""; };
    };
  };
}
