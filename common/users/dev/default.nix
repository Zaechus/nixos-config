{ username, ... }: { pkgs, ... }:

{
  users.users.${username}.packages = with pkgs; [
    nil # Nix LSP
    tokei
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
