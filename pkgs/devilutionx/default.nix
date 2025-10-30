{ stdenv
, fetchFromGitHub
, fetchurl
, bzip2
, cmake
, fmt
, gettext
, libpng
, libsodium
, libtiff
, libwebp
, pkg-config
, SDL2
, SDL2_image
, simpleini
, smpq
}:

let
  asio = fetchurl {
    url = "https://github.com/diasurgical/asio/archive/4bcf552fcea3e1ae555dde2ab33bc9fa6770da4d.tar.gz";
    sha256 = "sha256-AFBy5OFsAzxZsiI4DirIHh+VjFkdalEhN9OGqhC0Cvc=";
  };
  libmpq = fetchurl {
    url = "https://github.com/diasurgical/libmpq/archive/b78d66c6fee6a501cc9b95d8556a129c68841b05.tar.gz";
    sha256 = "sha256-NIzZwr6cBn38uKLWzW+Uet5QiOFUPB5dsf3FsS22ruo=";
  };
  libsmackerdec = fetchurl {
    url = "https://github.com/diasurgical/libsmackerdec/archive/91e732bb6953489077430572f43fc802bf2c75b2.tar.gz";
    sha256 = "sha256-5WXjfvGuT4hG2cnCS4YbxW/c4tek7OR95EjgCqkEi4c=";
  };
  libzt = fetchFromGitHub {
    owner = "diasurgical";
    repo = "libzt";
    fetchSubmodules = true;
    rev = "1a9d83b8c4c2bdcd7ea6d8ab1dd2771b16eb4e13";
    sha256 = "sha256-/A77ZM4s+br1hYa0OBdjXcWXUXYG+GiEYcW8VB+UJHo=";
  };
  SDL_audiolib = fetchurl {
    url = "https://github.com/realnc/SDL_audiolib/archive/cc1bb6af8d4cf5e200259072bde1edd1c8c5137e.tar.gz";
    sha256 = "sha256-WtxxvuNQaxbFBcFmLac/z9/YeJFGRXhPgPxw25eVM6U=";
  };
in
stdenv.mkDerivation rec {
  pname = "devilutionx";
  version = "1.5.5";

  src = fetchFromGitHub {
    owner = "diasurgical";
    repo = "devilutionX";
    rev = version;
    sha256 = "sha256-XfHpKERYZ+VCeWx95568FEEZ4UZg3Z4abA8mG4kHjy0=";
  };

  postPatch = ''
    substituteInPlace 3rdParty/asio/CMakeLists.txt --replace-fail "${asio.url}" "${asio}"
    substituteInPlace 3rdParty/libmpq/CMakeLists.txt --replace-fail "${libmpq.url}" "${libmpq}"
    substituteInPlace 3rdParty/libsmackerdec/CMakeLists.txt --replace-fail "${libsmackerdec.url}" "${libsmackerdec}"
    substituteInPlace 3rdParty/libzt/CMakeLists.txt \
      --replace-fail "GIT_REPOSITORY https://github.com/${libzt.owner}/${libzt.repo}.git" "" \
      --replace-fail "GIT_TAG ${libzt.rev}" "SOURCE_DIR ${libzt}"
    substituteInPlace 3rdParty/SDL_audiolib/CMakeLists.txt --replace-fail "${SDL_audiolib.url}" "${SDL_audiolib}"
  '';

  nativeBuildInputs = [
    cmake
    pkg-config
    gettext
    smpq
  ];

  buildInputs = [
    bzip2
    fmt
    libpng
    libsodium
    libtiff
    libwebp
    SDL2
    SDL2_image
    simpleini
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install devilutionx $out/bin
    install devilutionx.mpq $out/bin

    runHook postInstall
  '';
}
