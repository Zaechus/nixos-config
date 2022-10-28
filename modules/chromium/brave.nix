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

  home.sessionVariables.BROWSER = "brave";

  xdg.mimeApps.defaultApplications = {
    "text/html" = "brave-browser.desktop"; # for some reason this isn't a default
    "application/pdf" = "brave-browser.desktop";
    "image/svg+xml" = "brave-browser.desktop";
  };
}
