{
  services.openssh = {
    enable = true;
    settings = {
      # PasswordAuthentication = false;
      # KbdInteractiveAuthentication = false;
      # PermitRootLogin = "no";
      PermitRootLogin = "prohibit-password";
      LogLevel = "VERBOSE";
    };
  };

  services.fail2ban = {
    enable = true;
  };
}
