{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      core.pager = "${pkgs.delta}/bin/delta";
      delta.line-numbers = true;
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };
}
