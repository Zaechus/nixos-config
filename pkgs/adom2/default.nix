{ stdenv
, fetchurl
, autoPatchelfHook
, makeWrapper
, ncurses5
}:

stdenv.mkDerivation rec {
  pname = "adom2";
  version = "2.3.8";

  src = fetchurl {
    url = "https://www.adom.de/home/download/old/${version}/adom_linux_debian_64_${version}.tar.gz";
    hash = "sha256-cEehVp9LtKhH90cmisYdvZlPUQ0CLTW8B38/dgVsBVo=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    ncurses5
  ];

  installPhase = ''
    runHook preInstall

    install -D adom $out/bin/${pname}
    makeWrapper $out/bin/${pname} $out/bin/adom

    runHook postInstall
  '';
}
