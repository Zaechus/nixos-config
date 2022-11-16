{ config, ... }:

{
  imports = [
    ./options.nix
    ../themes/theme.nix
    ./bottom
    ./git
    ./helix
    ./nushell
    ./starship
    ./zoxide
  ];

  programs.bat.enable = true;
}
