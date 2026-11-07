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
    rev = "3d521281e4c58c19805dffd687f8aa475f66d803";
    hash = "sha256-G+m0uCE+UN5RZUsEzsNvBsolSb2QZQWA/h2S5dfODmk=";
  };

  cargoHash = "sha256-rt7lPX8Vtyppggpt9Mp0+tnUx5LFXEpMpmcrLflrvRo=";

  nativeBuildInputs = [
    perl
  ];
}
