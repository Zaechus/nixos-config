{ lib, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "fvs";
  version = "0.3.4";

  src = fetchFromGitHub {
    owner = "mirkobrombin";
    repo = pname;
    rev = version;
    sha256 = "sha256-ODad0PHDcw90KvOUMcsJW2NgZGqDo2BJlpiRozWOp/0=";
  };

  propagatedBuildInputs = with python3Packages; [ orjson ];

  meta = with lib; {
    homepage = "https://github.com/mirkobrombin/FVS";
    description = "File Versioning System with hash comparison and data storage";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
