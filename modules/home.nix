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
    # MANPAGER = "sh -c 'col -bx | bat -l man -p'"; # FIXME: '-l man' broken for now
    MANPAGER = "bat -p";
  };

  home.shellAliases = {
    diff = "diff --color";
    doas = "sudo";
    ip = "ip -c";

    l = "ls";
    la = "l -a";
    ll = "l -l";
    lal = "l -al";

    pp = "ping 1.1.1.1";
    x = "xdg-open";
  };
}
