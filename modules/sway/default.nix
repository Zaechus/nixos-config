{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu
      swayidle
      swaylock
      wf-recorder
      wl-clipboard
      wl-mirror # output mirroring
      grim # screenshotting
      slurp # screenshot selection
    ];
  };
}
