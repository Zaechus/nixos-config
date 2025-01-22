{ username ? "", ... }: { pkgs, ... }:

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

  system.activationScripts =
    let
      config_file = pkgs.writeTextFile {
        name = "cargo-config";
        text = ''
          [target.x86_64-unknown-linux-gnu]
          linker = "clang"
          rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

          [registries.crates-io]
          protocol = "sparse"
        '';
      };
      config_dir = "/home/${username}/.cargo";
      config_dest = "${config_dir}/config.toml";
    in
    {
      cargo_config = {
        deps = [ "users" ];
        text =
          if username != "" then ''
            if [ -d "/home/${username}" ]; then
              install -d -o ${username} -g users ${config_dir}
              ln -sf ${config_file} ${config_dest}
              chown -h ${username}:users ${config_dest}
            fi
          '' else "";
      };
    };
}
