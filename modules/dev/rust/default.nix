{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    clang
    llvmPackages.bintools
    rust-analyzer
    vscode-extensions.llvm-org.lldb-vscode
  ];

  networking.firewall.allowedTCPPorts = [ 7878 ];
}
