{ stdenv
, fetchurl
, autoPatchelfHook
, makeWrapper
, ncurses5
}:

stdenv.mkDerivation rec {
  pname = "adom3";
  version = "3.0.6";

  src = fetchurl {
    url = "https://www.adom.de/home/download/old/${version}/adom_linux_debian_64_${version}.tar.gz";
    hash = "sha256-WI3cO2gMiVL8EDB0fMoAR69k5I0REesBTqoJT0S2yaU=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    (ncurses5.override {
      unicodeSupport = false;
      withTermlib = true;
    })
  ];

  installPhase = ''
    runHook preInstall

    install -D adom $out/bin/${pname}
    makeWrapper $out/bin/${pname} $out/bin/adom

    runHook postInstall
  '';
}
