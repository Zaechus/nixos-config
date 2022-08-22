{
  imports = [
    ./options.nix
    ../themes/theme.nix
    ./bottom
    ./helix
    ./nushell
    ./zoxide
    ../themes/tokyonight
  ];

  programs.bat.enable = true;

  programs.zellij.settings.simplified_ui = true;

  home = {
    homeDirectory = "/home/wsl";
    username = "wsl";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}
