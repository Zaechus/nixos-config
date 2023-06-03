{ lib
, stdenv
, fetchFromGitHub
, cmake
, directx-shader-compiler
, libGLU
, libpng
, libjpeg_turbo
, openal
, rapidjson
, SDL2
, vulkan-headers
, vulkan-loader
, zlib
}:

stdenv.mkDerivation rec {
  pname = "RBDOOM-3-BFG";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "RobertBeckebans";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-bjjeTdbQDWTibSrIWhCnr6F0Ef17efLgWGQAAwezjUw=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    directx-shader-compiler
  ];

  buildInputs = [
    libGLU
    libpng
    libjpeg_turbo
    openal
    rapidjson
    SDL2
    vulkan-headers
    vulkan-loader
    zlib
  ];

  cmakeDir = "../neo";
  cmakeFlags = [
    "-DONATIVE=ON"
    "-DFFMPEG=OFF"
    "-DBINKDEC=ON"
    "-DUSE_SYSTEM_LIBGLEW=ON"
    "-DUSE_SYSTEM_LIBPNG=ON"
    "-DUSE_SYSTEM_LIBJPEG=ON"
    "-DUSE_SYSTEM_RAPIDJSON=ON"
    "-DUSE_SYSTEM_ZLIB=ON"
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
