{ pkgs, ... }:

{
  hardware.opengl.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bemenu grim slurp swaylock wl-clipboard
      alacritty
    ];
  };

  #xdg.portal.wlr.enable = true;
}
