{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    envFile.text =
      config.nu.LS_COLORS + "\n" +
      "let-env BROWSER = \"" + config.home.sessionVariables.BROWSER + "\"\n" +
      "let-env EDITOR = \"" + config.home.sessionVariables.EDITOR + "\"\n" +
      "let-env VISUAL = \"" + config.home.sessionVariables.VISUAL + "\"\n" +
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
