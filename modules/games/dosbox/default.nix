{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
}
