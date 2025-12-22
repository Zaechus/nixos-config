{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    packages = with pkgs; [
      my.dosbox-staging
    ];

    files = {
      ".config/dosbox/arena.conf".source = ./arena.conf;
      ".config/dosbox/dagger.conf".source = ./dagger.conf;
      ".config/dosbox/default.conf".source = ./default.conf;
      ".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
      ".config/dosbox/gauntlet.conf".source = ./gauntlet.conf;
      ".config/dosbox/mk1.conf".source = ./mk1.conf;
      ".config/dosbox/mk1.map".source = ./mk1.map;
      ".config/dosbox/mk2.conf".source = ./mk2.conf;
      ".config/dosbox/mk2.map".source = ./mk2.map;
      ".config/dosbox/mk3.conf".source = ./mk3.conf;
      ".config/dosbox/mk3.map".source = ./mk3.map;
      ".config/dosbox/tie.conf".source = ./tie.conf;
      ".config/dosbox/tie.map".source = ./tie.map;
    };
  };
}
