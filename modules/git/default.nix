{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        # side-by-side = true;
      };
    };
  };
}
