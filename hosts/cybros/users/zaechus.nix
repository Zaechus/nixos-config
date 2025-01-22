{
  imports = [
    (import ../../../modules/dev/rust { username = "zaechus"; })
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ../../../users/zaechus/home.nix
      ../../../home
      ../../../themes/gruvbox/home.nix
      ../../../home/graphical
      ../../../home/thinkpad
      ../../../home/zellij
      ../../../home/games/dosbox
      ../../../home/games/nethack

      ../../../home/tiny
      ../../../home/games/doomrl
      ../../../home/games/dwarf-fortress
    ];

    programs.git.enable = true;

    wayland.windowManager.sway.config.output = {
      eDP-1 = {
        pos = "0 0";
        subpixel = "rgb";
      };
      DP-1 = {
        pos = "1920 0";
      };
    };

    home.stateVersion = "21.11";
  };
}
