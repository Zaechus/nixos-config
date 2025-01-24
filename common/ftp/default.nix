{
  services.vsftpd = {
    enable = true;
    anonymousUser = true;
    extraConfig = ''
      pasv_min_port=40000;
      pasv_max_port=50000;
    '';
  };

  networking.firewall.allowedTCPPorts = [ 20 21 ];
  networking.firewall.allowedTCPPortRanges = [
    { from = 40000; to = 50000; }
  ];
}
