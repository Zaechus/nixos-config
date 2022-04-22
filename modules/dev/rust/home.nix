{ pkgs, ... }:

{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim coc-rust-analyzer
  ];
}
