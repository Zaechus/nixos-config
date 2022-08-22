{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    envFile.text =
      config.nu.LS_COLORS + "\n" +
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
