{
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];
  };

  home-manager.users.zaechus = {
    imports = [
      ./tiny.nix
    ];

    programs.git = {
      userName = "Zaechus";
      userEmail = "zaechus@pm.me";
    };
  };
}
