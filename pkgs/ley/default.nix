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
    rev = "refs/heads/main";
    hash = "sha256-9MsbEbZX7l9ONv5qKVztZ+80swdlDtDnhxNK50nokvE=";
  };

  cargoHash = "sha256-n33yj4nLTcnKW8ynv6IzlYxM8Fvj9gcRhDM5hi/0rO8=";

  nativeBuildInputs = [
    perl
  ];
}
