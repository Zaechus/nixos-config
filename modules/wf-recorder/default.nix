{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wf-recorder
  ];

  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];

  environment.shellAliases = {
    wf-share = "f(){sudo modprobe v4l2loopback exclusive_caps=1 card_label=WfRecorder && wf-recorder --muxer=v4l2 --codec=rawvideo --file=$1 -x yuv420p; sleep 1; sudo rmmod v4l2loopback; unset -f f;}; f"; # /dev/video0
  };
}
