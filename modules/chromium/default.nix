{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
    ];
  };

  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
}
