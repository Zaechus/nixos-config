{ stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "iir1";
  version = "1.9.3";

  src = fetchFromGitHub {
    owner = "berndporr";
    repo = pname;
    rev = "${version}";
    hash = "sha256-YC5QbuhU0rB3SydJ6wDkK3O+eSYdK1+3nIAcrQhAcHE=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildPhase = ''
    cmake .
    make
  '';

  # installPhase = ''
  #   make install
  # '';
}
