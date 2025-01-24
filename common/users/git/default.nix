{ username ? ""
, email ? ""
, name ? ""
, ...
}: { pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      core.pager = "${pkgs.delta}/bin/delta";
      delta.line-numbers = true;
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };

  files."/home/${username}/.config/git/config".text = ''
    [user]
    	email = "${email}"
    	name = "${name}"
  '';
}
