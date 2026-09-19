{
  rustPlatform,
  fetchFromGitHub,
  perl,
}:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "93dbe2e8eb159092182616e653ce46665e6214ef";
    hash = "sha256-jS/NjrLGPGcHdBAfW4aNAHvCVSAcoXrvKtjqSWCQOLk=";
  };

  cargoHash = "sha256-6lSBlWvj8lHn4HJixeN8ReUs3dsOiMG+rLM758mU0JE=";

  nativeBuildInputs = [
    perl
  ];
}
