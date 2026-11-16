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
    rev = "209477e4ffdfa6a7bd8036f742ab19c25a77afe1";
    hash = "sha256-Z0z0eImkjHSfgTDxBdAcaLpI+xDSTHkV4pcVHpa2Fi8=";
  };

  cargoHash = "sha256-bSWMxfn8v7j4wyrT4d6ncaqJeh9CtTZ5EcDhCM7VkUY=";

  nativeBuildInputs = [
    perl
  ];
}
