{ config, lib, pkgs, ... }:

let
  PROMPT =
    if config.programs.starship.enable == false then ''
      def create_left_prompt [] {
        $"\n(ansi blue_bold)($env.PWD | str replace $env.HOME ~)(ansi reset)(ansi green_bold)\n〉"
      }

      let-env PROMPT_COMMAND = { create_left_prompt }
      let-env PROMPT_COMMAND_RIGHT = { "" }

      let-env PROMPT_INDICATOR = { "" }
      let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
      let-env PROMPT_INDICATOR_VI_NORMAL = { ") " }
    '' else "";
  aliasStr = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "alias ${k} = ${v}")
      config.home.shellAliases) + "\n";
  varStr = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "let-env ${k} = \"${v}\"")
      config.home.sessionVariables) + "\n" + ''
    let-env PATH = ($env.PATH | split row ':') # convert PATH to table
    let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
  '' + "\n";
  LS_COLORS = if (builtins.stringLength config.nu.LS_COLORS) > 0 then
    "let-env LS_COLORS = (vivid generate ${config.nu.LS_COLORS} | str trim)\n"
    else "";
  zoxide_init = if config.programs.zoxide.enable then ''
    mkdir .cache/zoxide
    zoxide init nushell --hook prompt | save .cache/zoxide/init.nu
  '' else "";
  zoxide_source = if config.programs.zoxide.enable then ''
    source .cache/zoxide/init.nu
  '' else "";
in
{
  programs.nushell = {
    enable = true;
    extraEnv =
      PROMPT +
      varStr +
      LS_COLORS +
      zoxide_init;
    configFile.source = ./config.nu;
    extraConfig =
      aliasStr + "\n" +
      zoxide_source +
      "\n" + config.nu.startup + "\n";
  };

  programs.helix.settings.editor.shell = [ "nu" "-c" ];
}
