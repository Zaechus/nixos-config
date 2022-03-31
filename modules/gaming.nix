# A superset of the graphical configuration, the gaming module includes packages
# needed for gaming

{
  imports = [
    ../modules/graphical.nix
  ];

  environment.systemPackages = with pkgs; [
    lutris
  ];
}
