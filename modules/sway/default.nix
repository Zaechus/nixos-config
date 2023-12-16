{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu
      brightnessctl
      swayidle
      swaylock
      wf-recorder
      wl-clipboard
      wl-mirror # output mirroring
      grim # screenshot
      slurp # screenshot selection
      jq # parse outputs for screenshot
    ];
  };
}
