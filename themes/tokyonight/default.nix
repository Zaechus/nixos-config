# https://github.com/folke/tokyonight.nvim
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml

{ username, ... }: { config, ... }:

{
  imports = [ ../theme.nix ];

  theme = {
    bg = "#24283b";
    fg = "#c0caf5";

    black = "#1D202F";
    red = "#f7768e";
    green = "#9ece6a";
    yellow = "#e0af68";
    blue = "#7aa2f7";
    magenta = "#bb9af7";
    cyan = "#7dcfff";
    white = "#a9b1d6";

    bright = {
      black = "#414868";
      white = "#c0caf5";
    };

    primary = "#475fc4"; # blue
    secondary = config.theme.blue;
  };

  # https://chrome.google.com/webstore/detail/tokyonight/enpfonmmpgoinjpglildebkaphbhndek
  programs.chromium.extensions = [ "enpfonmmpgoinjpglildebkaphbhndek" ];

  users.users.${username} = {
    programs.alacritty.settings.colors.indexed_colors = [
      { index = 16; color = "#ff9e64"; }
      { index = 17; color = "#db4b4b"; }
    ];

    programs.helix.settings.theme = "tokyonight_storm";

    programs.zellij.settings.theme = "tokyonight-storm";
  };
}
