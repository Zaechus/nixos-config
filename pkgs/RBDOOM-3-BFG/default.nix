{ lib
, stdenv
, fetchFromGitHub
, cmake
, directx-shader-compiler
, libGLU
, openal
, SDL2
, vulkan-headers
, vulkan-loader
}:

stdenv.mkDerivation rec {
  pname = "RBDOOM-3-BFG";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "RobertBeckebans";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-r/dvTirgFXdBJ+Gjl6zpHoGCTPoo0tRmOCV9oCdnltI=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    directx-shader-compiler
  ];

  buildInputs = [
    libGLU
    openal
    SDL2
    vulkan-headers
    vulkan-loader
  ];

  # https://github.com/RobertBeckebans/RBDOOM-3-BFG/blob/master/neo/cmake-linux-release.sh
  cmakeDir = "../neo";
  cmakeFlags = [
    "-DONATIVE=ON"
    "-DFFMPEG=OFF"
    "-DBINKDEC=ON"
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install RBDoom3BFG $out/bin/RBDoom3BFG

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/RobertBeckebans/RBDOOM-3-BFG";
    description = "Doom 3 BFG Edition with modern engine features";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
  };
}
