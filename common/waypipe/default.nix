{ pkgs, ... }:

{
  imports = [
    ../ssh
  ];

  environment.systemPackages = with pkgs; [
    my.waypipe
    xwayland-satellite
    # pulseaudio # pactl
  ];

  services.openssh.startWhenNeeded = true;
}
