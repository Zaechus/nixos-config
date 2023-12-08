{
  imports = [
    ../../../modules/home.nix
    ../../../themes/gruvbox
  ];

  home = {
    homeDirectory = "/home/lizzie";
    username = "lizzie";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}
