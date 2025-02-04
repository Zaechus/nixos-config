{ stdenv
, fetchFromGitLab
}:

stdenv.mkDerivation rec {
  pname = "bin2iso";
  version = "2.0";

  src = fetchFromGitLab {
    owner = "bunnylin";
    repo = pname;
    rev = version;
    sha256 = "sha256-JUKjKj/ThlpITb+NUaNtnysIVyl7dVQq1kQIiHF/UKY=";
  };

  installPhase = ''
    install -Dm755 $pname $out/bin/$pname
  '';
}
