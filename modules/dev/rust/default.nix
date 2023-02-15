{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    rust-analyzer
    vscode-extensions.llvm-org.lldb-vscode # for hx
  ];

  home.file.".cargo/config.toml".text = ''
    [build]
    rustflags = ["-Clink-arg=-fuse-ld=lld"]
  '';

  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim
    coc-rust-analyzer
  ];
}
