{ username, ... }: { config, lib, pkgs, ... }:

let
  aliases = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "alias ${k} = ${v}")
      config.environment.shellAliases) + "\n\n";
  vars =
    lib.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "$env.${k} = \"${v}\"")
        config.environment.sessionVariables) + "\n\n" + ''
      $env.PATH = ($env.PATH | split row (char esep))
      $env.PATH = (if $'($env.HOME)/.cargo/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($env.HOME)/.cargo/bin' })
      $env.PATH = (if $'($env.HOME)/.local/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($env.HOME)/.local/bin' })
    '' + "\n";
  LS_COLORS = "$env.LS_COLORS = (${pkgs.vivid}/bin/vivid generate ${config.programs.vivid.theme} | str trim)\n";
  PROMPT =
    if !config.programs.starship.enable then ''
      def create_left_prompt [] {
        $"\n(ansi blue_bold)($env.PWD | str replace $env.HOME ~)(ansi reset)(ansi green_bold)\n〉"
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
