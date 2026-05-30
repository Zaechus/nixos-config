{
  imports = [
    ./core.nix
  ];

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = "true";
      DNSSEC = "true";
      LLMNR = "false";
    };
  };
}
