{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-N/mNkw6IjJPVwWKAHaPNhjv2i6hHlEvsL23iPVrTak0=";
  };

  cargoHash = "sha256-EvqHCbAVJBuyQL2trC8by/CUkusqTNwxKBAl6zj9n+U=";
}
