{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-VIJusKc2wAWv+tXkDG7ujf661BL2Z4CcMiXS7cfFQNA=";
  };

  cargoHash = "sha256-SghdVaf1ZsK2Bu7/A9k1/iVZ90xA5mYeT8MNTT2l2/k=";
}

