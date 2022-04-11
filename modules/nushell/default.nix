{
  programs.starship.enable = true;

  programs.nushell = {
    enable = true;

    settings = {
      edit_mode = "vi";
      prompt = ''STARSHIP_SHELL="nu" starship prompt'';
    };
  };
}
