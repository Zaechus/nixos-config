{ pkgs, ... }:

{
  imports = [
    ./default.nix
  ];

  programs.chromium.package = pkgs.brave;

  home.sessionVariables.BROWSER = "brave";

  xdg.mimeApps.defaultApplications = {
    "text/html" = "brave-browser.desktop"; # for some reason this isn't a default
    "application/pdf" = "brave-browser.desktop";
  };
}
