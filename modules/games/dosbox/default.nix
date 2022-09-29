{ pkgs, ... }: {
  home.packages = with pkgs; [
    dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
  home.file.".config/dosbox/gauntlet.conf".source = ./gauntlet.conf;
}
