{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-gitgutter
      nvim-tree-lua
      lualine-nvim
      bufferline-nvim nvim-web-devicons
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = builtins.readFile ./init.vim;
  };

  systemd.user.sessionVariables = rec {
    EDITOR = "nvim";
  };
}
