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

  system.activationScripts = let
    cargo_config_dir = "/home/${username}/.cargo";
    cargo_config_dest = "${cargo_config_dir}/config.toml";
    cargo_config_text = ''
        [target.x86_64-unknown-linux-gnu]
        linker = "clang"
        rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

        [registries.crates-io]
        protocol = "sparse"
    '';
  in {
    cargo = {
      deps = [ "users" ];
      text = if username != "" then ''
        if [ -d "/home/${username}" ]; then
          install -d -o ${username} -g users ${cargo_config_dir}
          printf '${cargo_config_text}' > ${cargo_config_dest}
          chown ${username}:users ${cargo_config_dest}
          chmod 444 ${cargo_config_dest}
        fi
      '' else "";
    };
  };
}
