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

  system.activationScripts =
    let
      config_file = pkgs.writeTextFile {
        name = "config-git-config";
        text = ''
          [user]
          	email = "${email}"
          	name = "${name}"
        '';
      };
      config_dir = "/home/${username}/.config/git";
      config_dest = "${config_dir}/config";
    in
    {
      git_config = {
        deps = [ "users" ];
        text =
          if username != "" then ''
            if [ -d "/home/${username}" ]; then
              install -d -o ${username} -g users ${config_dir}
              ln -sf ${config_file} ${config_dest}
              chown -h ${username}:users ${config_dest}
            fi
          '' else "";
      };
    };
}
