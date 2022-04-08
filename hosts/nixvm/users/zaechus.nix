{
  imports = [
    ../../../users/zaechus.nix
  ];

  home-manager.users.zaechus.imports = [
    ../../../modules/home.nix
    ../../../modules/graphical-home.nix
  ];
}
