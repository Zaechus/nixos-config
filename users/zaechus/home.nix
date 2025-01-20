{
  imports = [
    ./base.nix
    ../../modules/home.nix
    ../../themes/gruvbox/home.nix
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
