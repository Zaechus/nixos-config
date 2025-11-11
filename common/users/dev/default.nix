{ username, ... }: { pkgs, ... }:

{
  users.users.${username}.packages = with pkgs; [
    nil # Nix LSP
    tokei
  ];

  # documentation.man.generateCaches = true; # FIXME: https://github.com/NixOS/nixpkgs/issues/384499
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
