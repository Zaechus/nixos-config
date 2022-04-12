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
      bufferline-nvim nvim-web-devicons
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = builtins.readFile ./init.vim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
