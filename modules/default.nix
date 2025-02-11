{ config, lib, pkgs, ... }:

with lib;

let
  userOptions = {
    options.files = mkOption {
      type = with types; attrsOf (submodule ({ name, config, options, ... }: {
        options = {
          text = mkOption {
            type = types.str;
            default = "";
          };
          source = mkOption { type = types.path; };
        };
        config = {
          source = mkIf (config.text != "") (
            pkgs.writeText name config.text
          );
        };
      }));
      default = { };
    };
  };
in
{
  imports = [
    ./alacritty
    ./bottom
    ./git
    ./helix
    ./nushell
    ./sway
    ./theme.nix
    ./zellij
  ];

  options.users.users = mkOption {
    type = with types; attrsOf (submodule userOptions);
  };

  config = {
    system.activationScripts = {
      link-files = {
        deps = [ "users" ];
        text = concatStringsSep "\n" (flatten (mapAttrsToList
          (name: user: mapAttrsToList
            (dest: file: ''
              path="${user.home}/${dest}"
              mkdir -p "$(dirname "$path")"
              ln -sf ${file.source} "$path"
              while [ "$path" != "${user.home}" ]; do
                chown -h ${user.name}:${user.group} "$path"
                path="$(dirname "$path")"
              done
            '')
            user.files)
          config.users.users));
      };
    };
  };
}
