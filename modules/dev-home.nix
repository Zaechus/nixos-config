{ pkgs, ... }:

{
  programs.neovim = {
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
      rust-tools-nvim coc-rust-analyzer coc-nvim nvim-lspconfig
    ];
  };
}
