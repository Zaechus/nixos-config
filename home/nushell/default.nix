{ config, lib, ... }:

let
  PROMPT =
    if !config.programs.starship.enable then ''
      def create_left_prompt [] {
        $"\n(ansi blue_bold)($env.PWD | str replace $env.HOME ~)(ansi reset)(ansi green_bold)\n〉"
      }

      $env.PROMPT_COMMAND = { create_left_prompt }
    '' else "";
  aliases = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "alias ${k} = ${v}")
      config.home.shellAliases) + "\n";
  vars =
    lib.concatStringsSep "\n"
      (lib.mapAttrsToList (k: v: "$env.${k} = \"${v}\"")
        config.home.sessionVariables) + "\n\n" + ''
      $env.PATH = ($env.PATH | split row (char esep))
      $env.PATH = (if $'($env.HOME)/.cargo/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($env.HOME)/.cargo/bin' })
      $env.PATH = (if $'($env.HOME)/.local/bin' in $env.PATH { $env.PATH } else { $env.PATH | prepend $'($env.HOME)/.local/bin' })
    '' + "\n";
  # LS_COLORS =
  #   if (builtins.stringLength config.vivid.theme) > 0 then
  #     "\n$env.LS_COLORS = (vivid generate ${config.vivid.theme} | str trim)\n\n"
  #   else "";
  zoxideEnv =
    if config.programs.zoxide.enable then ''
      zoxide init nushell | save -f ~/.zoxide.nu
      open ~/.zoxide.nu | str replace -a 'def-env' 'def --env' | save -f ~/.zoxide.nu
      open ~/.zoxide.nu | str replace -a ' -- $rest ' ' -- ...$rest ' | save -f ~/.zoxide.nu
    '' else "";
  zoxideConfig =
    if config.programs.zoxide.enable then
      "\n" + "source ~/.zoxide.nu" + "\n" else "";
in
{
  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
    extraEnv =
      PROMPT +
      vars +
      # LS_COLORS +
      zoxideEnv;
    configFile.source = ./config.nu;
    extraConfig =
      aliases +
      zoxideConfig;
  };

  programs.helix.settings = {
    editor.shell = [ "nu" "-c" ];
    keys.normal."C-z" = "no_op"; # nushell doesn't have suspend
  };

  programs.zellij.settings.default_shell = "nu";
}
