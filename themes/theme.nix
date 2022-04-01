{ config, lib, options, ... }:

with lib;

{
  options.theme = {
    bg = mkOption { type = types.str; };
    fg = mkOption { type = types.str; };

    black = mkOption { type = types.str; };
    red = mkOption { type = types.str; };
    green = mkOption { type = types.str; };
    yellow = mkOption { type = types.str; };
    blue = mkOption { type = types.str; };
    magenta = mkOption { type = types.str; };
    cyan = mkOption { type = types.str; };
    white = mkOption { type = types.str; };

    blackBright = mkOption { type = types.str; };
    redBright = mkOption { type = types.str; };
    greenBright = mkOption { type = types.str; };
    yellowBright = mkOption { type = types.str; };
    blueBright = mkOption { type = types.str; };
    magentaBright = mkOption { type = types.str; };
    cyanBright = mkOption { type = types.str; };
    whiteBright = mkOption { type = types.str; };

    gray = mkOption { type = types.str; };
    color = mkOption { type = types.str; };
    colorFg = mkOption { type = types.str; };
  };
}
