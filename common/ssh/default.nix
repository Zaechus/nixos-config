{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password";
      LogLevel = "VERBOSE";
    };
  };

  services.fail2ban = {
    enable = true;
  };
}
