{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    envFile.text =
      config.nu.LS_COLORS +
      builtins.readFile ./env.nu;
    configFile.text =
      builtins.readFile ./config.nu +
      config.nu.startup;
  };

  programs.starship.enable = true;

  home.packages = with pkgs; [ vivid ];

  programs.helix.settings.editor.shell = [ "nu" "-c" ];
}
