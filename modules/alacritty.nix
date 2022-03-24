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

      windows = {
        opacity = 0.8;
      };
    };
  };
}
