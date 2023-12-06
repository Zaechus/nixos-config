{
  imports = [
    ../../../modules/home.nix
    ../../../themes/gruvbox
    ../../../modules/laptop/home.nix
  ];

  home = {
    homeDirectory = "/home/lizzie";
    username = "lizzie";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}
