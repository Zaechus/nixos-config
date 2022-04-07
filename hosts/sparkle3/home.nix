{
  imports =
    [
      ../../themes/gruvbox
      ../../modules/neovim
      ../../modules/laptop-home.nix
    ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lizzie";
  home.homeDirectory = "/home/lizzie";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
