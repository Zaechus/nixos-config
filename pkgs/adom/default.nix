{ stdenv
, fetchurl
, autoPatchelfHook
, ncurses5
}:

stdenv.mkDerivation rec {
  pname = "adom";
  version = "3.3.3";

  src = fetchurl {
    url = "https://www.adom.de/home/download/current/adom_linux_debian_64_${version}.tar.gz";
    hash = "sha256-t0oxDkGAYz117yZ0KTN5YmG0dSUqQSPGxJLuTOltSN0=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    (ncurses5.override {
      unicodeSupport = false;
      withTermlib = true;
    })
  ];

  installPhase = ''
    runHook preInstall

    install -D adom $out/bin/adom

    runHook postInstall
  '';
}
