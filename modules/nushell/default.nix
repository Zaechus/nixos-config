{ config, lib, ... }:

let
  PROMPT =
    if !config.programs.starship.enable then ''
      def create_left_prompt [] {
        $"\n(ansi blue_bold)($env.PWD | str replace $env.HOME ~)(ansi reset)(ansi green_bold)\n〉"
      }

      $env.PROMPT_COMMAND = { create_left_prompt }
    '' else "";
  aliasStr = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "alias ${k} = ${v}")
      config.home.shellAliases) + "\n";
  varStr = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "$env.${k} = \"${v}\"")
      config.home.sessionVariables) + "\n" + ''
    $env.PATH = ($env.PATH | split row ':')
    $env.PATH = ($env.PATH | prepend $'($env.HOME)/.cargo/bin')
  '' + "\n";
  LS_COLORS =
    if (builtins.stringLength config.nu.LS_COLORS) > 0 then
      "$env.LS_COLORS = (vivid generate ${config.nu.LS_COLORS} | str trim)\n"
    else "";
  zoxideEnv = if config.programs.zoxide.enable then ''
    zoxide init nushell | save -f ~/.zoxide.nu
    open ~/.zoxide.nu | str replace -a 'def-env' 'def --env' | save -f ~/.zoxide.nu
  '' else "";
  zoxideConfig = if config.programs.zoxide.enable then
    "\n" + "source ~/.zoxide.nu" + "\n" else "";
in
{
  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
    extraEnv =
      PROMPT +
      varStr +
      LS_COLORS +
      zoxideEnv;
    configFile.source = ./config.nu;
    extraConfig =
      aliasStr +
      zoxideConfig;
  };

  programs.helix.settings = {
    editor.shell = [ "nu" "-c" ];
    keys.normal."C-z" = "no_op"; # nushell doesn't have suspend
  };

  programs.zellij.settings.default_shell = "nu";
}
