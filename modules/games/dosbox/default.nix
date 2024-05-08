{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
  home.file.".config/dosbox/tie.conf".source = ./tie.conf;
  home.file.".config/dosbox/tie.map".source = ./tie.map;
}
