{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo
    clang
    mold
    rust-analyzer
    rustc
    rustfmt
    # rustup
    vscode-extensions.llvm-org.lldb-vscode # for hx
  ];

  home.file.".cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

    [registries.crates-io]
    protocol = "sparse"
  '';

  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim
    coc-rust-analyzer
  ];
}
