{ stdenv
, fetchFromGitHub
, cmake
, directx-shader-compiler
, ffmpeg
, libGLU
, openal
, SDL2
, vulkan-headers
, vulkan-loader
}:

stdenv.mkDerivation rec {
  name = "RBDOOM-3-BFG";
  version = "1.4.0";
  src = fetchFromGitHub {
    owner = "RobertBeckebans";
    repo = "RBDOOM-3-BFG";
    rev = "f81a8c1dd9b762774a233ba071837b2c7a374751";
    sha256 = "sha256-r/dvTirgFXdBJ+Gjl6zpHoGCTPoo0tRmOCV9oCdnltI=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [
    cmake
    directx-shader-compiler
    libGLU
    openal
    SDL2
    vulkan-headers
    vulkan-loader
  ];

  configurePhase = ''
    mkdir build
    cd build
    ls /build/source/neo/extern
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DFFMPEG=OFF -DBINKDEC=ON ../neo
  '';

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    install RBDoom3BFG $out/bin/RBDoom3BFG
  '';
}
