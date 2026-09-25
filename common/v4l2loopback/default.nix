{ config, lib, ... }:

{
  boot = lib.mkIf (!config.programs.obs-studio.enableVirtualCamera) {
    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/programs/obs-studio.nix
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
