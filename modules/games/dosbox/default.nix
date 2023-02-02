{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # dosbox-staging
    my.dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
}
