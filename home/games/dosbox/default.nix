{ pkgs, ... }:

{
  home.packages = with pkgs; [
    my.dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
  home.file.".config/dosbox/default.conf".source = ./default.conf;
  home.file.".config/dosbox/gauntlet.conf".source = ./gauntlet.conf;
  home.file.".config/dosbox/mk.conf".source = ./mk.conf;
  home.file.".config/dosbox/mk.map".source = ./mk.map;
  home.file.".config/dosbox/tie.conf".source = ./tie.conf;
  home.file.".config/dosbox/tie.map".source = ./tie.map;
}
