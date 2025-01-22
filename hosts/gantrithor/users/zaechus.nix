{ lib, ... }:

{
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ../../../users/zaechus/home.nix
      ../../../home
      ../../../themes/tokyonight/home.nix
      ../../../home/graphical
      ../../../home/thinkpad
    ];

    programs.git.enable = true;

    programs.alacritty.settings.font.size = lib.mkOverride 0 10.0;

    home.stateVersion = "21.11";
  };
}
