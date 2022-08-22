{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  z.init = ''
    mkdir ~/.cache/zoxide
    zoxide init nushell --hook prompt | save ~/.cache/zoxide/init.nu
  '';
  z.source = "source ~/.cache/zoxide/init.nu";
}
