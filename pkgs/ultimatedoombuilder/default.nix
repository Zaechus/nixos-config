{ stdenv
, fetchFromGitHub
, libGL
, libX11
, mono
, msbuild
}:

stdenv.mkDerivation rec {
  name = "ultimatedoombuilder";
  src = fetchFromGitHub {
    owner = "jewalky";
    repo = "UltimateDoomBuilder";
    rev = "5cf8ed914abf6a0cebd7b21ad0f2bcdc74df0a40";
    sha256 = "sha256-xGhTsHzaqXViddFo2FsThHk0YKQjy6K1XgAEcHu/D2Y=";
  };
  nativeBuildInputs = [
    libGL
    libX11
    msbuild
  ];
  buildInputs = [
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
}
