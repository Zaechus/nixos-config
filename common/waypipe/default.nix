{ pkgs, ... }:

{
  imports = [
    ../ssh
  ];

  environment.systemPackages = with pkgs; [ waypipe ];

  services.openssh.startWhenNeeded = true;
}
