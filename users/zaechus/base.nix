{
  imports = [
    ./tiny.nix
  ];

  home = {
    homeDirectory = "/home/zaechus";
    username = "zaechus";
  };

  programs.git = {
    userName = "Zaechus";
    userEmail = "zaechus@pm.me";
  };
}
