{ username, ... }: { pkgs, ... }:

{
  users.users.${username}.packages = with pkgs; [
    inlyne # markdown viewer
    nil # Nix LSP
    tokei
  ];

  # documentation.man.cache.enable = true;
  # documentation.man.cache.generateAtRuntime = true;
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
