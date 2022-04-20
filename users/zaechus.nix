{
  home-manager.users.zaechus.imports = [
    ../modules/git
  ];

  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
  };
}
