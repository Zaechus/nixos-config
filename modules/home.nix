{ config, ... }:

{
  imports = [
    ./options.nix
    ../themes/theme.nix
    ./bottom
    ./git
    ./helix
    ./nushell
    ./starship
    ./zoxide
  ];

  programs.bat.enable = true;

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  home.shellAliases = {
    cp = "cp -i";
    diff = "diff --color";
    doas = "sudo";
    ip = "ip -c";

    l = "ls";
    la = "l -a";
    ll = "l -l";
    lal = "l -al";

    mv = "mv -i";
    pp = "ping 1.1.1.1";
    x = "xdg-open";
  };
}
