{ pkgs, lib, modulesPath, ... }:

let
  username = "nixos";
in
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
    ../../modules
    ../../common
    ../../common/network/core.nix
    ../../common/network/wireless.nix
    ../../common/network/bluetooth.nix
    ../../common/graphical
    ../../common/games
    (import ../../common/users { inherit username; })
    (import ../../common/users/themes/gruvbox { inherit username; })
    (import ../../common/users/graphical { inherit username; })
    (import ../../common/users/games/dosbox { inherit username; })
    (import ../../common/users/games/nethack { inherit username; })
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" ];

    files.".config/nushell/login.nu".text = lib.mkForce "\n";
    programs.sway.config.startup = lib.mkForce [];
  };

  boot = {
    loader.timeout = lib.mkForce 5;
    supportedFilesystems.zfs = lib.mkForce false;
  };
  networking = {
    firewall.enable = false;
    wireless.enable = lib.mkForce false;
  };

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    my.angband
    my.endless-sky
  ];
}
