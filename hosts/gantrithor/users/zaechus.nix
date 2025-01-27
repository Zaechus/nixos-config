{ lib, ... }:

let
  username = "zaechus";
in
{
  imports = [
    (import ../../../common/users { inherit username; })
    (import ../../../themes/gruvbox { inherit username; })
    (import ../../../common/users/graphical { inherit username; })

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
      ../../../themes/tokyonight/home.nix
      ../../../home/sway
      ../../../home/thinkpad
    ];

    programs.git.enable = true;

    programs.alacritty.settings.font.size = lib.mkOverride 0 10.0;

    home.stateVersion = "21.11";
  };
}
