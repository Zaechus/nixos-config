{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-tozHxOF2ZHgPNIaiOsajsv3reI9vA+/9zQGZlcNVHZk=";
  };

  cargoHash = "sha256-EvqHCbAVJBuyQL2trC8by/CUkusqTNwxKBAl6zj9n+U=";
}
