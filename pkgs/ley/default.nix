{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-ot5xMOow7ayppdcEjk3uNGCCG/uCN2rdqkpvNynDk/o=";
  };

  cargoHash = "sha256-ZDUxVPoTohXc2rrNbgaGiiYTBCe15dz+7qQ7bLettQY=";
}
