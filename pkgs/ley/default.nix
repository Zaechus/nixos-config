{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-RpHOIUXcl6qt3i16Qq4xBfhO+hH53sZwi7LXRfEp4Hs=";
  };

  cargoHash = "sha256-SghdVaf1ZsK2Bu7/A9k1/iVZ90xA5mYeT8MNTT2l2/k=";
}

