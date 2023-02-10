{ lib, fetchFromGitHub, python3Packages, imagemagick }:

python3Packages.buildPythonPackage rec {
  pname = "icoextract";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "jlu5";
    repo = pname;
    rev = version;
    sha256 = "sha256-BqcGLG3T3neifncUp1wSMumvi7ZgQs3hE7JyMUhBypI=";
  };

  propagatedBuildInputs = with python3Packages; [
    pefile
    # pillow
    # setuptools
  ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/jlu5/icoextract";
    description = "an icon extractor for Windows PE files (.exe/.dll)";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
