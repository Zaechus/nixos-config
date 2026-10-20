{ lib
, stdenv
, fetchFromGitHub

, cmake
, directx-shader-compiler
, ispc

, SDL2
, ncurses
, openal
, rapidjson
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
    SDL2
    ncurses
    openal
    rapidjson
    vulkan-headers
    vulkan-loader
    zlib
  ];

  cmakeDir = "../neo";
  cmakeFlags = [
    (lib.cmakeBool "FFMPEG" false)
    (lib.cmakeBool "BINKDEC" true)
    (lib.cmakeBool "USE_SYSTEM_RAPIDJSON" true)
    (lib.cmakeBool "USE_SYSTEM_ZLIB" true)
  ];

  buildFlags = [ "RBDoom3BFG" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install RBDoom3BFG $out/bin/RBDoom3BFG

    runHook postInstall
  '';

  meta = with lib; {
    description = "Doom 3 BFG Edition with modern engine features";
    homepage = "https://github.com/RobertBeckebans/RBDOOM-3-BFG";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
  };
}
