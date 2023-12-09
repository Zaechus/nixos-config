{
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
    ];
    commandLineArgs = [
      "--flag-switches-begin"
      "--hide-sidepanel-button"
      "--show-avatar-button=never"
      "--flag-switches-end"
    ];
  };
}
