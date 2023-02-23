{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    mold
    rustup
    rust-analyzer
    vscode-extensions.llvm-org.lldb-vscode # for hx
  ];

  home.file.".cargo/config.toml".text = ''
    [build]
    rustflags = ["-Clink-arg=-fuse-ld=${pkgs.mold}/bin/mold"]
  '';

  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim
    coc-rust-analyzer
  ];
}
