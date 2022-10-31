{ config, lib, pkgs, ... }:

let
  varStr = lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "let-env ${k} = \"${v}\"")
      config.home.sessionVariables) + "\n";
  LS_COLORS = if (builtins.stringLength config.nu.LS_COLORS) > 0 then "let-env LS_COLORS = (vivid generate ${config.nu.LS_COLORS} | str trim)\n" else "";
in
{
  programs.nushell = {
    enable = true;
    envFile.text =
      varStr +
      LS_COLORS +
      builtins.readFile ./env.nu + "\n" +
      config.starship.init + "\n" +
      config.z.init + "\n";
    configFile.text =
      builtins.readFile ./config.nu + "\n" +
      config.z.source + "\n" +
      config.starship.source + "\n" +
      config.nu.startup + "\n";
  };

  programs.helix.settings.editor.shell = [ "nu" "-c" ];
}
