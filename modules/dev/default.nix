{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyperfine tokei
  ];
}
