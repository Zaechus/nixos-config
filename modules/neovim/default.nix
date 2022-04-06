{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-gitgutter nvim-tree-lua barbar-nvim vim-nix
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
