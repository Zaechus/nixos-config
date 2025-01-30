{ config, lib, ... }:

with lib;

{
  # TODO
  options.theme = {
    bg = mkOption { type = types.str; default = "#191919"; };
    fg = mkOption { type = types.str; default = "#cccccc"; };

    bg1 = mkOption { type = types.str; default = config.theme.bg; };
    fg0 = mkOption { type = types.str; default = "#ffffff"; };

    black = mkOption { type = types.str; default = "#111111"; };
    red = mkOption { type = types.str; default = "#ff0000"; };
    green = mkOption { type = types.str; default = "#00ff00"; };
    yellow = mkOption { type = types.str; default = "#ffff00"; };
    blue = mkOption { type = types.str; default = "#0000ff"; };
    magenta = mkOption { type = types.str; default = "#ff00ff"; };
    cyan = mkOption { type = types.str; default = "#00ffff"; };
    white = mkOption { type = types.str; default = "#eeeeee"; };

    bright = {
      black = mkOption { type = types.str; default = config.theme.black; };
      red = mkOption { type = types.str; default = config.theme.red; };
      green = mkOption { type = types.str; default = config.theme.green; };
      yellow = mkOption { type = types.str; default = config.theme.yellow; };
      blue = mkOption { type = types.str; default = config.theme.blue; };
      magenta = mkOption { type = types.str; default = config.theme.magenta; };
      cyan = mkOption { type = types.str; default = config.theme.cyan; };
      white = mkOption { type = types.str; default = config.theme.white; };
    };

    primary = mkOption { type = types.str; default = config.theme.blue; };
    secondary = mkOption { type = types.str; default = config.theme.cyan; };
  };
}
