{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nethack
  ];

  home.file.".nethackrc".source = ./nethackrc;
}
