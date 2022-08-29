{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    clang
    llvmPackages.bintools
    rust-analyzer
    vscode-extensions.llvm-org.lldb-vscode
  ];
}
