{
  imports = [
    ../modules/desktop.nix
  ];

  environment.systemPackages = with pkgs; [
    lutris
  ];
}
