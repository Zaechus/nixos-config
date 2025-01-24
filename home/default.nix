{
  imports = [
    ../themes/theme.nix
    ./bottom
    ./helix
    ./nushell
    ./starship
    ./zoxide
  ];

  programs.bat.enable = true;

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
