{ pkgs, ... }:

{
  imports = [
    ../ssh
  ];

  environment.systemPackages = with pkgs; [
    my.waypipe
    xwayland-satellite
  ];

  services.openssh.startWhenNeeded = true;
}
