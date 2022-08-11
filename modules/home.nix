{ config, ... }:

{
  imports = [
    ./options.nix
    ../themes/theme.nix
    ./bottom
    ./git
    ./helix
    ./nushell
    ./zoxide
  ];

  programs.bat.enable = true;
}
