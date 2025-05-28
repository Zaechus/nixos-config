{ stdenv
, fetchurl
, autoPatchelfHook
, makeWrapper
, ncurses5
}:

stdenv.mkDerivation rec {
  pname = "adom1";
  version = "1.1.1";

  src = fetchurl {
    url = "https://www.adom.de/home/download/old/${version}/adom_linux_elf_${version}.tar.gz";
    hash = "sha256-MgDoFMbHDxo+y26CZRgD2y+DfCs5jKWXx93/6nc0OLs=";
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
