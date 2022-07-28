{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup gcc rust-analyzer
  ];
}
