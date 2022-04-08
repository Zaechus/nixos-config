{
  environment.systemPackages = with pkgs; [
    rustup gcc tokei rust-analyzer
  ];
}
