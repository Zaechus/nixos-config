{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-kpGmjwcru2uM7ZBYB+H9PQXvLd7Dp5L2mp6wcatGZdA=";
  };

  cargoHash = "sha256-ryMVd+rj2wYjHVajvKuX13EPsRPFZaxNb7nAylb3dDY=";
}
