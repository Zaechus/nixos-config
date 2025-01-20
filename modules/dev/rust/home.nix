{ pkgs, ... }:

{
  home.file.".cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    linker = "clang"
    rustflags = ["-C", "link-arg=-fuse-ld=${pkgs.mold}/bin/mold"]

    [registries.crates-io]
    protocol = "sparse"
  '';

  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim
    coc-rust-analyzer
  ];
}
