{ pkgs, ... }: {
  home.packages = with pkgs; [
    dosbox-staging
  ];

  home.file.".config/dosbox-staging/dosbox-staging.conf".source = ./dosbox-staging.conf;
}
