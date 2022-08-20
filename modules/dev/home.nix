{ pkgs, ... }:

{
  imports = [
    ../zellij
  ];

  programs.neovim = {
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
      coc-nvim
      nvim-lspconfig
    ];

    extraConfig = builtins.readFile ../neovim/dev.vim;
  };
}
