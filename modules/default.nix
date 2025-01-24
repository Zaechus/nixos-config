{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    files = mkOption {
      type = with types; attrsOf (submodule ({ name, config, options, ... }: {
        options = {
          text = mkOption {
            type = types.str;
            default = "";
          };
          source = mkOption { type = types.path; };
        };
        config = {
          source = lib.mkIf (config.text != "") (
            pkgs.writeText name config.text
          );
        };
      }));
      default = { };
    };
  };

  # TODO: verify paths; user perms; delete old links?
  config = {
    system.activationScripts = {
      files = {
        deps = [ "users" ];
        text = concatStringsSep "\n" (mapAttrsToList (dest: file: "mkdir -p $(dirname ${dest}); ln -sf ${file.source} ${dest}") config.files);
      };
    };
  };
}
