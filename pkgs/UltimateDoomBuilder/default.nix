{ lib
, stdenv
, fetchFromGitHub
, msbuild
, libGL
, libX11
, mono
}:

stdenv.mkDerivation rec {
  pname = "UltimateDoomBuilder";
  version = "3.0.0.3274";

  src = fetchFromGitHub {
    owner = "jewalky";
    repo = pname;
    rev = "6d5098a075706e995105af50b6840fe53afb65bd";
    hash = "sha256-yQ1dhWwpAT2awjp8oQFynjez+2mLWxS9eJ4Jva0pWEk=";
  };

  nativeBuildInputs = [ msbuild ];

  buildInputs = [
    libGL
    libX11
    mono
  ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/opt
    cp -r Build $out/opt/UltimateDoomBuilder
    substituteInPlace $out/opt/UltimateDoomBuilder/builder --replace mono ${mono}/bin/mono
    substituteInPlace $out/opt/UltimateDoomBuilder/builder --replace Builder.exe $out/opt/UltimateDoomBuilder/Builder.exe
    ln -sf $out/opt/UltimateDoomBuilder/builder $out/bin/builder
  '';

  meta = with lib; {
    description = "Comprehensive map editor for Doom";
    homepage = "http://doombuilder.com";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
