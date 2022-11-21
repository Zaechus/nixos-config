{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
}
