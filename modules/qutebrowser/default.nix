{ config, ... }:

{
  programs.qutebrowser = {
    enable = true;

    extraConfig = builtins.readFile ./config.py +
      ''
      c.colors.tabs.selected.odd.bg = '${config.theme.bg}'
      c.colors.tabs.selected.even.bg = '${config.theme.bg}'
    '';
  };
}
