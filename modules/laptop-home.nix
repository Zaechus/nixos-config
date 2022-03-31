# Extra packages/configuration for laptop devices which extra requirments such
# as brightness control and batteries

{ lib, ... }:

{
  programs.zsh.shellAliases = {
    btm = lib.mkOverride 1 "btm -R --battery";
  };
}
