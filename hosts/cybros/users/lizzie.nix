{
  imports = [
    ../../../users/lizzie
  ];

  home-manager.users.lizzie = {
    imports = [
      ../../../modules/home.nix
      ../../../themes/tokyonight
      ../../../modules/laptop/thinkpad.nix
      ../../../modules/graphical/home.nix
    ];

    home.stateVersion = "21.11";
  };
}
