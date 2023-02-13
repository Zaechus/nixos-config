{
  users.users.zaechus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.zaechus = {
    programs.git = {
      userName = "Zaechus";
      userEmail = "zaechus@proton.me";
    };

    programs.tiny.settings = {
      servers = [{
        addr = "irc.libera.chat";
        port = 6697;
        tls = true;
        nicks = [ "Zaechus" ];
        realname = "Zaechus";
        sasl = {
          username = "Zaechus";
          password.command = "cat /home/zaechus/.config/tiny/password";
          pem = "/home/zaechus/.config/tiny/libera.pem";
        };
      }];
      defaults = {
        tls = true;
        realname = "Zaechus";
        nicks = [ "Zaechus" ];
      };
    };
  };
}
