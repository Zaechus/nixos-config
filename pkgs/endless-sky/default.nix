{ lib
, stdenv
, fetchFromGitHub
, cmake
, flac
, glew
, libavif
, libjpeg
, libmad
, libogg
, libpng
, libuuid
, libX11
, minizip
, openal
, pkg-config
, SDL2
}:

stdenv.mkDerivation rec {
  pname = "endless-sky";
  version = "0.10.16";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-QO7Yv8H7hvavyOG/G9+HZh+a7XlCAf7fyPlszvOF91M=";
  };

  patches = [
    ./resources.patch
  ];

  postPatch = ''
    substituteInPlace source/Files.cpp \
      --replace-fail '@NIXPKGS_RESOURCES_PATH@' "$out/share/games/endless-sky/"
  '';

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    flac
    glew
    libavif
    libjpeg
    libmad
    libogg
    libpng
    libuuid
    libX11
    minizip
    openal
    SDL2
  ];

  meta = with lib; {
    homepage = "https://endless-sky.github.io/";
    description = "Space exploration, trading, and combat game";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
  };
}
