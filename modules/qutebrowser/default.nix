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

        c.colors.tabs.selected.odd.bg = '${config.theme.primary}'
        c.colors.tabs.selected.even.bg = '${config.theme.primary}'
        c.colors.tabs.odd.bg = '${config.theme.bg}'
        c.colors.tabs.even.bg = '${config.theme.bg}'

        c.colors.webpage.bg = '${config.theme.bg}'

        c.colors.statusbar.normal.bg = '${config.theme.black}'
        c.colors.statusbar.normal.fg = '${config.theme.fg}'
        c.colors.statusbar.insert.bg = '${config.theme.bright.blue}'
        c.colors.statusbar.command.fg = '${config.theme.fg}'
      '';
  };
}
