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
    ./bat
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
              link_file() {
                path="$1/$2"
                mkdir -p "$(dirname "$path")"
                ln -sf ${file.source} "$path"
                while [ "$path" != "$1" ]; do
                  chown -h ${user.name}:${user.group} "$path"
                  path="$(dirname "$path")"
                done
              }
              link_file "${user.home}" "${dest}"
              gcrootpath="/nix/var/nix/gcroots/user-files/${user.name}"
              link_file "$gcrootpath" "${dest}"
              chown ${user.name}:${user.group} "$gcrootpath"
              chmod 700 "$gcrootpath"
            '')
            user.files)
          config.users.users));
      };
    };
  };
}
