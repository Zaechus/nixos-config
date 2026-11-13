{
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
    ];
    # https://chromeenterprise.google/policies/
    extraOpts = {
      "AIModeSettings" = 1;
      "BrowserSignin" = 0;
      "DefaultBrowserSettingEnabled" = false;
      "EnableMediaRouter" = false;
      "PasswordManagerEnabled" = false;
      "PromotionsEnabled" = false;
      "ShowHomeButton" = false;
      "SyncDisabled" = true;
    };
    extraOptsRecommended = {
      "BookmarkBarEnabled" = false;
      "HomepageIsNewTabPage" = true;
      "RestoreOnStartup" = 1;
    };
  };
}
