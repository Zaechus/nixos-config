{ username, ... }: { config, lib, pkgs, ... }:

let
  aliases = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "alias ${k} = ${v}")
      (lib.filterAttrs (k: v: builtins.typeOf v == "string")
        config.environment.shellAliases)) + "\n\n";
  vars =
    lib.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "$env.${k} = \"${v}\"")
        config.environment.sessionVariables) + "\n\n" + ''
      $env.PATH = (if $'($nu.home-dir)/.cargo/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($nu.home-dir)/.cargo/bin' })
      $env.PATH = (if $'($nu.home-dir)/.local/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($nu.home-dir)/.local/bin' })
    '' + "\n";
  LS_COLORS = "$env.LS_COLORS = (${lib.getExe pkgs.vivid} generate ${config.programs.vivid.theme} | str trim)\n";
  PROMPT =
    if !config.programs.starship.enable then ''
      def create_left_prompt [] {
        $"\n(ansi blue_bold)($env.PWD | str replace $nu.home-dir ~)(ansi reset)(ansi green_bold)\n〉"
      }

      $env.PROMPT_COMMAND = { create_left_prompt }
    '' else ''
      mkdir ($nu.data-dir | path join "vendor/autoload")
      ${config.programs.starship.package}/bin/starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
    '';
in
{
  programs.starship.enable = true;

  users.users.${username} = {
    programs.nushell = {
      enable = true;
      envText = (builtins.readFile ./env.nu) +
        vars +
        LS_COLORS;
      configText = (builtins.readFile ./config.nu) + "\n" +
        aliases +
        PROMPT;
    };

    programs.helix.settings = {
      editor.shell = [ "nu" "-c" ];
      keys.normal."C-z" = "no_op"; # nushell doesn't have suspend
    };

    programs.zellij.settings.default_shell = "nu";
  };
}
