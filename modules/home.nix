{ config, ... }:

{
  imports = [
    ./options.nix
    ../themes/theme.nix
    ./bottom
    ./git
    ./helix
    ./nushell
    ./zoxide
  ];

  programs.bat.enable = true;

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat";
  };

  home.shellAliases = {
    diff = "diff --color";
    doas = "sudo";
    ip = "ip -c";
    l = "exa --icons --color=always";
    ll = "l -aalg";
    lisosort = "exa -lRs size --no-permissions --no-user --no-time ~/images/disk/**/*.iso";
    pp = "ping 1.1.1.1";
    watch = "watch -c -n 1 ";
  };
}
