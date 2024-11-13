{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-3mVHX1zdqMeCmm1DAK7LM3X4+sU2sK+SS7UiaAeBXLc=";
  };

  cargoHash = "sha256-zQc2GUaPDcmNnMVS6MisZ/GfyVIiMrTvMj7bGHMa+O4=";
}
