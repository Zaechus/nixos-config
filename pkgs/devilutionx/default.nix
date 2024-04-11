{ stdenv
, fetchFromGitHub
, fetchurl
, bzip2
, cmake
, gettext
, pkg-config
, libsodium
, SDL2
, SDL2_image
, fmt
, libpng
, smpq
}:

let
  asio = fetchurl {
    url = "https://github.com/diasurgical/asio/archive/bd1c839ef741b14365e77964bdd5a78994c05934.tar.gz";
    sha256 = "sha256-ePcdyvOfO5tyPVP+8t3+cS/XeEp47lfaE8gERRVoJSM=";
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
    rev = "d6c6a069a5041a3e89594c447ced3f15d77618b8";
    sha256 = "sha256-ttRJLfaGHzhS4jd8db7BNPWROCti3ZxuRouqsL/M5ew=";
  };
  SDL_audiolib = fetchurl {
    url = "https://github.com/realnc/SDL_audiolib/archive/cc1bb6af8d4cf5e200259072bde1edd1c8c5137e.tar.gz";
    sha256 = "sha256-WtxxvuNQaxbFBcFmLac/z9/YeJFGRXhPgPxw25eVM6U=";
  };
  simpleini = fetchurl {
    url = "https://github.com/brofield/simpleini/archive/56499b5af5d2195c6acfc58c4630b70e0c9c4c21.tar.gz";
    sha256 = "sha256-29tQoz0+33kfwmIjCdnD1wGi+35+K0A9P6UE4E8K3g4=";
  };
in
stdenv.mkDerivation rec {
  pname = "devilutionx";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "diasurgical";
    repo = "devilutionX";
    rev = version;
    sha256 = "sha256-XILPpIYSC0+CbhyVXCNvAknAhqU7VW1dWZCh2BapQjs=";
  };

  postPatch = ''
    substituteInPlace 3rdParty/asio/CMakeLists.txt --replace-fail "${asio.url}" "${asio}"
    substituteInPlace 3rdParty/libmpq/CMakeLists.txt --replace-fail "${libmpq.url}" "${libmpq}"
    substituteInPlace 3rdParty/libsmackerdec/CMakeLists.txt --replace-fail "${libsmackerdec.url}" "${libsmackerdec}"
    substituteInPlace 3rdParty/libzt/CMakeLists.txt \
      --replace-fail "GIT_REPOSITORY https://github.com/${libzt.owner}/${libzt.repo}.git" "" \
      --replace-fail "GIT_TAG ${libzt.rev}" "SOURCE_DIR ${libzt}"
    substituteInPlace 3rdParty/SDL_audiolib/CMakeLists.txt --replace-fail "${SDL_audiolib.url}" "${SDL_audiolib}"
    substituteInPlace 3rdParty/simpleini/CMakeLists.txt --replace-fail "${simpleini.url}" "${simpleini}"
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
    SDL2
    SDL2_image
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install devilutionx $out/bin
    install devilutionx.mpq $out/bin

    runHook postInstall
  '';
}
