let
  username = "zaechus";
in
{
  imports = [
    (import ../../../modules/dev/rust { inherit username; })
    (import ../../../modules/git {
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
      ../../../themes/gruvbox/home.nix
      ../../../themes/theme.nix

      # ../../../home
      ../../../modules/options.nix
      ../../../home/nushell

      # ../../../home/graphical
      ../../../home/alacritty
      ../../../home/sway
    ];

    home.shellAliases = {
      btm = "btm -R --battery"; # TODO: use bottom.toml
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
