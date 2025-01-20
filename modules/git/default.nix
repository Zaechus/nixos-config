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
      config_dir = "/home/${username}/.config/git";
      config_dest = "${config_dir}/config";
      config_text = ''
        [user]
        	email = "${email}"
        	name = "${name}"
      '';
    in
    {
      git_config = {
        deps = [ "users" ];
        text =
          if username != "" then ''
            if [ -d "/home/${username}" ]; then
              install -d -o ${username} -g users ${config_dir}
              printf '${config_text}' > ${config_dest}
              chown ${username}:users ${config_dest}
              chmod 444 ${config_dest}
            fi
          '' else "";
      };
    };
}
