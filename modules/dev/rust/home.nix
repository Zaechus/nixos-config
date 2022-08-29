{ pkgs, ... }:

{
  home.file.".cargo/config.toml".text = ''
    [target.x86_64-unknown-linux-gnu]
    rustflags = [ "-C", "link-arg=-fuse-ld=lld" ]
  '';

  programs.neovim.plugins = with pkgs.vimPlugins; [
    rust-tools-nvim
    coc-rust-analyzer
  ];
}
