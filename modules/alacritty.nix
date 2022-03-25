{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "FiraCode";

          style = "Retina";

          size = 11.0;
        };
      };

      #window = {
      #  opacity = 0.8;
      #};
      background_opacity = 0.8;
    };
  };
}
