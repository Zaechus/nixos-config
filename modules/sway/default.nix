{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu
      swaylock
      wf-recorder
      wl-clipboard
      wl-mirror # output mirroring
      grim # screenshotting
      slurp # screenshot selection
      lm_sensors # i3status-rust temperature block
    ];
  };
}
