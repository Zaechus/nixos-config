{ lib, ... }:

{
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ../../../users/zaechus/home.nix
      ../../../modules/home.nix
      ../../../themes/tokyonight
      ../../../modules/graphical/home.nix
      ../../../modules/laptop/thinkpad
    ];

    programs.alacritty.settings.font.size = lib.mkOverride 0 10.0;

    home.stateVersion = "21.11";
  };
}
