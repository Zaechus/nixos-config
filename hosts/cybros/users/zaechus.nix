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
      ../../../modules/home.nix
      ../../../themes/gruvbox/home.nix
      ../../../modules/graphical/home.nix
      ../../../modules/laptop/thinkpad
      ../../../modules/zellij/home.nix
      ../../../modules/games/dosbox
      ../../../modules/games/nethack

      ../../../modules/tiny
      ../../../modules/games/doomrl
      ../../../modules/games/dwarf-fortress
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
