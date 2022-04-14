{ config, ... }:

{
  programs.qutebrowser = {
    enable = true;

    extraConfig = builtins.readFile ./config.py +
      ''
      c.colors.tabs.selected.odd.fg = '#ffffff'
      c.colors.tabs.selected.even.fg = '#ffffff'
      c.colors.tabs.odd.fg = '${config.theme.fg}'
      c.colors.tabs.even.fg = '${config.theme.fg}'

      c.colors.tabs.selected.odd.bg = '${config.theme.color}'
      c.colors.tabs.selected.even.bg = '${config.theme.color}'
      c.colors.tabs.odd.bg = '${config.theme.bg}'
      c.colors.tabs.even.bg = '${config.theme.bg}'

      c.colors.webpage.bg = '${config.theme.bg}'
    '';
  };
}
