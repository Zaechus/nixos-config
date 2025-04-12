{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    my.mangos-classic
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  networking.firewall.allowedTCPPorts = [
    3724
    8085
  ];
}
