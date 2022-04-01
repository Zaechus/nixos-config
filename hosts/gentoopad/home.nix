{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/home.nix
      ../../themes/nord.nix
      ../../modules/graphical-home.nix
      ../../modules/git
      ../../modules/thinkpad-home.nix
    ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "zaechus";
  home.homeDirectory = "/home/zaechus";

  wayland.windowManager.sway.config = {
    terminal = lib.mkOverride 0 "/usr/bin/alacritty"; # opengl issue

    output = {
      eDP-1 = { bg = "${../../modules/sway/background.jpg} fill"; };
    };
  };

  # Gentoo-specific aliases
  programs.zsh.shellAliases = {
    batworld = ''
      sed 's~.*/~~' /var/lib/portage/world | sort | bat
    '';
  };

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
