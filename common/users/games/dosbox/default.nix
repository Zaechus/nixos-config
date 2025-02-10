{ username, ... }: { pkgs, ... }:

{
  users.users.${username} = {
    packages = with pkgs; [
      my.dosbox-staging
    ];

    files = {
      ".config/dosbox/dosbox-staging.conf".source = ./dosbox-staging.conf;
      ".config/dosbox/default.conf".source = ./default.conf;
      ".config/dosbox/gauntlet.conf".source = ./gauntlet.conf;
      ".config/dosbox/mk.conf".source = ./mk.conf;
      ".config/dosbox/mk.map".source = ./mk.map;
      ".config/dosbox/tie.conf".source = ./tie.conf;
      ".config/dosbox/tie.map".source = ./tie.map;
    };
  };
}
