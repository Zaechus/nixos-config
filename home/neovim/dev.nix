{ pkgs, ... }:

{
  programs.neovim = {
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
      coc-nvim
      nvim-lspconfig

      # Rust
      rust-tools-nvim
      coc-rust-analyzer
    ];

    extraConfig = builtins.readFile ./dev.vim;
  };
}
