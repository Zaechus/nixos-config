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
    rev = "444e5cea494936af800c674febbbb7d253004c92";
    hash = "sha256-sBjE2Ygk0MnEqhUkO3S+5bFmur1dZRrAvB+TqR5rz8g=";
  };

  cargoHash = "sha256-DGThIVyotnV+r+2VydMGZ0N+8BUqS0SquSPLxT3oa3o=";

  nativeBuildInputs = [
    perl
  ];
}
