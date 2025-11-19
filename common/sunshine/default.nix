{
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true; # kms
    openFirewall = true;
  };
  services.avahi.enable = false;
}
