{ config, ... }:

{
  programs.starship.enable = true;

  programs.nushell = {
    enable = true;
    #configFile.source = ./config.nu;
    #envFile.source = ./env.nu;

    #  startup = [
    #    "alias btm = ${config.alias.btm}"
    #    "alias diff = diff --color"
    #    "alias doas = sudo"
    #    "alias l = exa --icons --color=always"
    #    "alias ll = exa -aalg"
    #    "alias lisosort = exa -lRs size --no-permissions --no-user --no-time ~/images/disk/**/*.iso"
    #    "alias pp = ping 1.1.1.1"
    #    "alias watch = watch -c -n 1 "
    #  ];
    #};
  };
}
