{
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.zaechus = {
    programs.git = {
      userName = "Zaechus";
      userEmail = "zaechus@proton.me";
    };
  };
}
