{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-gitgutter

      nvim-tree-lua
      toggleterm-nvim

      lualine-nvim
      bufferline-nvim
      nvim-web-devicons

      markdown-preview-nvim
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = builtins.readFile ./init.vim;
  };
}
