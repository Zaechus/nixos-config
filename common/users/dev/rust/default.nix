{ username, ... }: { pkgs, ... }:

{
  imports = [ (import ../default.nix { inherit username; }) ];

  users.users.${username} = {
    packages = with pkgs; [
      cargo
      clang
      clippy
      lldb
      rust-analyzer
      rustc
      rustfmt
      # rustup
      wild

      gnumake
      # openssl
      perl
    ];

    files.".cargo/config.toml".text = ''
      [target.'cfg(target_os = "linux")']
      linker = "clang"
      rustflags = ["-Clink-arg=--ld-path=${pkgs.wild}/bin/wild"]
    '';
  };
}
