{ pkgs, ... }: {
  home.packages = with pkgs; [
    dosbox-staging
  ];

  home.file.".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
  home.file.".config/dosbox/max.conf".source = ./max.conf;
  home.file.".config/dosbox/arena.conf".source = ./arena.conf;
  home.file.".config/dosbox/gauntlet.conf".source = ./gauntlet.conf;
  home.file.".config/dosbox/warcraft.conf".source = ./warcraft.conf;
}
