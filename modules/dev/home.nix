{ pkgs, ... }:

{
  imports = [
    ../zellij
  ];

  home.file.".cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

    [registries.crates-io]
    protocol = "sparse"
  '';

  programs.neovim = {
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
      coc-nvim
      nvim-lspconfig

      # Rust
      rust-tools-nvim
      coc-rust-analyzer
    ];

    extraConfig = builtins.readFile ../neovim/dev.vim;
  };
}
