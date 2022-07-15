{
  home-manager.users.zaechus.programs.git = {
    userName  = "Zaechus";
    userEmail = "maxwell.anderson.public@protonmail.com";
  };

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
  };
}
