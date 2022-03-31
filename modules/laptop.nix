# Extra packages/configuration for laptop devices which extra requirments such
# as brightness control and batteries

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
