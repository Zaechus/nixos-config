{ lib
, stdenv
, fetchFromGitHub
, cmake
, directx-shader-compiler
, ispc
, ncurses
, openal
, rapidjson
, SDL2
, vulkan-headers
, vulkan-loader
, zlib
}:

stdenv.mkDerivation rec {
  pname = "RBDOOM-3-BFG";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "RobertBeckebans";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-9BZEFO+e5IG6hv9+QI9OJecQ84rLTWBDz4k0GU6SeDE=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    directx-shader-compiler
    ispc
  ];

  buildInputs = [
    ncurses
    openal
    rapidjson
    SDL2
    vulkan-headers
    vulkan-loader
    zlib
  ];

  cmakeDir = "../neo";
  cmakeFlags = [
    "-DFFMPEG=OFF"
    "-DBINKDEC=ON"
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
