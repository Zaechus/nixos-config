{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-gitgutter vim-nix
      nvim-tree-lua
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
