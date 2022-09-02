{
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "main";

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };
    };
  };
}
