let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    ../../../common/users/graphical

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
      ../../../users/zaechus/home.nix
      ../../../themes/gruvbox/home.nix

      # ../../../home
      ../../../themes/theme.nix
      ../../../home/nushell
      ../../../home/starship

      ../../../home/sway

      ../../../home/thinkpad
      ../../../home/zellij
      ../../../home/games/dosbox
      ../../../home/games/nethack
    ];

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
        eDP-1 = {
          pos = "0 0";
          subpixel = "rgb";
        };
        DP-1 = {
          pos = "1920 0";
        };
      };
    };

    home.stateVersion = "21.11";
  };
}
