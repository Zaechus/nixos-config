{ pkgs, ... }:

{
  programs.neovim = {
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
      toggleterm-nvim
      rust-tools-nvim coc-rust-analyzer coc-nvim nvim-lspconfig
    ];

    extraConfig = builtins.readFile ./neovim/dev.vim;
  };
}
