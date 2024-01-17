{
  programs.tiny.settings = {
    servers = [{
      addr = "irc.libera.chat";
      port = 6697;
      tls = true;
      nicks = [ "Zaechus" ];
      realname = "Zaechus";
      join = [];
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
}
