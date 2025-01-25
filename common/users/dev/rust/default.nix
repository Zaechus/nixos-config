{ username, ... }: { pkgs, ... }:

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

  files."/home/${username}/.cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

    [registries.crates-io]
    protocol = "sparse"
  '';
}
