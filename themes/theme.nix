{ config, lib, options, ... }:

with lib;

{
  options.theme = {
    bg = mkOption { type = types.str; default = "#24283b"; };
    fg = mkOption { type = types.str; default = "#c0caf5"; };

    black = mkOption { type = types.str; default = "#1D202F"; };
    red = mkOption { type = types.str; default = "#f7768e"; };
    green = mkOption { type = types.str; default = "#9ece6a"; };
    yellow = mkOption { type = types.str; default = "#e0af68"; };
    blue = mkOption { type = types.str; default = "#7aa2f7"; };
    magenta = mkOption { type = types.str; default = "#bb9af7"; };
    cyan = mkOption { type = types.str; default = "#7dcfff"; };
    white = mkOption { type = types.str; default = "#a9b1d6"; };

    blackBright = mkOption { type = types.str; default = "#414868"; };
    redBright = mkOption { type = types.str; default = config.theme.red; };
    greenBright = mkOption { type = types.str; default = config.theme.green; };
    yellowBright = mkOption { type = types.str; default = config.theme.yellow; };
    blueBright = mkOption { type = types.str; default = config.theme.blue; };
    magentaBright = mkOption { type = types.str; default = config.theme.magenta; };
    cyanBright = mkOption { type = types.str; default = config.theme.cyan; };
    whiteBright = mkOption { type = types.str; default = "#c0caf5"; };

    gray = mkOption { type = types.str; default = "#5c5c5c"; };
    color = mkOption { type = types.str; default = "#4770c4"; };
    colorFg = mkOption { type = types.str; default = config.theme.blue; };
  };
}
