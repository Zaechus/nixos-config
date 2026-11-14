# https://github.com/folke/tokyonight.nvim
# https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty_tokyonight_storm.yml
# https://chrome.google.com/webstore/detail/tokyonight/enpfonmmpgoinjpglildebkaphbhndek

{ username, ... }: { pkgs, ... }:

{
  # programs.chromium.extensions = [ "hpcmeljpfhclmddogcblpfenipkdbdfh" ];
  # programs.tmux.plugins = [ pkgs.tmuxPlugins.tokyo-night-tmux ];
  # programs.vivid.theme = "tokyonight-storm";

  users.users.${username} = { config, ... }: {
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

    packages = with pkgs; [
      tokyonight-gtk-theme
    ];
    files.".gtkrc-2.0".source = ./gtkrc-2.0;
    files.".config/gtk-3.0/settings.ini".source = ./settings.ini;
    files.".config/gtk-4.0/settings.ini".source = ./settings.ini;
    files.".config/dconf/user.txt".source = ./user.txt;

    programs.alacritty.settings.colors.indexed_colors = [
      { index = 16; color = "#ff9e64"; }
      { index = 17; color = "#db4b4b"; }
    ];

    programs.helix.settings.theme = "tokyonight_storm";
  };
}
