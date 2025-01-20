{ pkgs, ... }:

{
  imports = [ ../default.nix ];

  environment.systemPackages = with pkgs; [
    cargo
    clang
    clippy
    mold
    rust-analyzer
    rustc
    rustfmt
    vscode-extensions.llvm-org.lldb-vscode # for helix
  ];
}
