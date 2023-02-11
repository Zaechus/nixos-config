{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clang # cc
    llvmPackages.bintools # lld
    rustup
    rust-analyzer
    vscode-extensions.llvm-org.lldb-vscode # hx
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
