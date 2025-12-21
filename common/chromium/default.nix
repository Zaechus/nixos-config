{
  programs.chromium = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
    ];
    extraOpts."EnableMediaRouter" = false;
    #enable-webrtc-hide-local-ips-with-mdns
  };
}
