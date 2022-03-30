{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bat exa fd ripgrep
    bottom
    git
  ];

  users.defaultUserShell = pkgs.zsh;
}
