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
      config.home.sessionVariables) + "\n";
  LS_COLORS = if (builtins.stringLength config.nu.LS_COLORS) > 0 then
    "let-env LS_COLORS = (vivid generate ${config.nu.LS_COLORS} | str trim)\n"
    else "";
  starship_init = if config.programs.starship.enable then ''
    mkdir ~/.cache/starship
    starship init nu | save ~/.cache/starship/init.nu
    sed -i 's/term size -c | get columns/(term size).columns/g' ~/.cache/starship/init.nu
  '' else "";
  starship_source = if config.programs.starship.enable then ''
    let-env PROMPT_INDICATOR_VI_INSERT = ": "
    let-env PROMPT_INDICATOR_VI_NORMAL = ") "
    source ~/.cache/starship/init.nu
  '' else "";
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
    envFile.text =
      PROMPT +
      varStr +
      LS_COLORS +
      "\n" + builtins.readFile ./env.nu + "\n" +
      starship_init +
      zoxide_init;
    configFile.text =
      builtins.readFile ./config.nu + "\n" +
      aliasStr + "\n" +
      zoxide_source +
      starship_source +
      "\n" + config.nu.startup + "\n";
  };

  programs.helix.settings.editor.shell = [ "nu" "-c" ];
}
