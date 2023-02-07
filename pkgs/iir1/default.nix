{ lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "iir1";
  version = "1.9.4";

  src = fetchFromGitHub {
    owner = "berndporr";
    repo = pname;
    rev = "${version}";
    hash = "sha256-T8gl51IkZIGq+6D5ge4Kb3wm5aw7Rhphmnf6TTGwHbs=";
  };

  nativeBuildInputs = [
    cmake
  ];

  meta = with lib; {
    homepage = "https://berndporr.github.io/iir1/";
    description = "DSP IIR realtime filter library written in C++";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
