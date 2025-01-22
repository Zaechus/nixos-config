{ pkgs, ... }:

{
  imports = [
    ./default.nix
  ];

  programs.chromium.package = pkgs.ungoogled-chromium;
}
