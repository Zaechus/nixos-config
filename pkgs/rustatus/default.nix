{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-gzhz2KvA40paCG/u9l3xnbYmZkkgeJaUXB6uBYzZ8tE=";
  };

  cargoHash = "sha256-knI7b9PRjOet24ZHHPtKGPQi5bsji/gv9WQOmJZdalQ=";
}

