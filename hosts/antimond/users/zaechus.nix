let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../themes/gruvbox { inherit username; })
    (import ../../../common/users/graphical { inherit username; })
    (import ../../../common/users/dev/rust { inherit username; })

    (import ../../../common/users/git {
      inherit username;
      email = "zaechus@pm.me";
      name = "Zaechus";
    })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
  home-manager.users.zaechus = {
    imports = [
      ../../../themes/theme.nix
      ../../../home/nushell
      ../../../home/sway
    ];

    theme = {
      bg = "#282828"; # bg 235
      fg = "#ebdbb2"; # fg 223

      bg1 = "#3c3836"; # bg1 237
      fg0 = "fbf1c7"; # fg0 229

      black = "#282828"; # bg 235
      red = "#cc241d"; # red 124
      green = "#98971a"; # green 106
      yellow = "#d79921"; # yellow 172
      blue = "#458588"; # blue 66
      magenta = "#b16286"; # purple
      cyan = "#689d6a"; # aqua 72
      white = "#a89984"; # gray 246

      bright = {
        black = "#928374"; # gray 245
        red = "#fb4934"; # red 167
        green = "#b8bb26"; # green 142
        yellow = "#fabd2f"; # yellow 214
        blue = "#83a598"; # blue 109
        magenta = "#d3869b"; # purple 175
        cyan = "#8ec07c"; # aqua 108
        white = "#ebdbb2"; # fg 223
      };

      primary = "#665c54"; # bg3 241
      secondary = "#fe8019"; # orange 208
    };

    home.shellAliases = {
      diff = "diff --color";
      doas = "sudo";
      ip = "ip -c";

      l = "ls";
      la = "l -a";
      ll = "l -l";
      lal = "l -al";

      pp = "ping 1.1.1.1";
      x = "xdg-open";
    };

    services.gammastep = {
      enable = true;
      dawnTime = "05:30-06:30";
      duskTime = "20:30-21:30";
    };

    wayland.windowManager.sway.config = {
      terminal = "alacritty msg create-window || alacritty";
      output = {
        eDP-2 = {
          pos = "0 0";
          subpixel = "rgb";
        };
        DP-4 = {
          pos = "2560 0";
        };
      };
      window.titlebar = false; # TODO: just get rid of home-manager....
    };

    home = {
      homeDirectory = "/home/zaechus";
      username = "zaechus";
    };

    home.stateVersion = "24.05";
  };
}
