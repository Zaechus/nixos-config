{ stdenv
, fetchFromGitHub
, libGL
, libX11
, mono
, msbuild
}:

stdenv.mkDerivation rec {
  name = "ultimatedoombuilder";
  nativeBuildInputs = [
    libGL
    libX11
    msbuild
  ];
  buildInputs = [
    mono
  ];
  src = fetchFromGitHub {
    owner = "jewalky";
    repo = "UltimateDoomBuilder";
    rev = "204982e5f884a2ed94cf8b46960007c1538c3ebf";
    sha256 = "1d4hc6lp4zxqv387vzf0cxryqx2g0036rxp6vah2vqnwi5isxl58";
  };
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/opt
    cp -r Build $out/opt/UltimateDoomBuilder
    substituteInPlace $out/opt/UltimateDoomBuilder/builder --replace mono ${mono}/bin/mono
    substituteInPlace $out/opt/UltimateDoomBuilder/builder --replace Builder.exe $out/opt/UltimateDoomBuilder/Builder.exe
    ln -sf $out/opt/UltimateDoomBuilder/builder $out/bin/builder
  '';
}
