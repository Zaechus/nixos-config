{ username, ... }: { pkgs, ... }:

{
  imports = [ (import ../default.nix { inherit username; }) ];

  users.users.${username} = {
    packages = with pkgs; [
      cargo
      clang
      clippy
      # lldb # FIXME
      mold
      rust-analyzer
      rustc
      rustfmt
      # rustup
    ];

    files.".cargo/config.toml".text = ''
      [target.'cfg(target_os = "linux")']
      linker = "clang"
      rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

      [registries.crates-io]
      protocol = "sparse"
    '';
  };
}
