{ lib, ... }:

{
  programs.zsh.shellAliases = {
    btm = lib.mkOverride 1 "btm -R --battery";
  };
}
