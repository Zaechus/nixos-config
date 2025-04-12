{ lib
, stdenv
, fetchFromGitHub

, cmake

, boost
, libmysqlclient
}:

let
  playerbots = fetchFromGitHub {
    owner = "cmangos";
    repo = "playerbots";
    rev = "89a06ed9f27af57b8ca6f08f055f5f8ff591cb4f";
    hash = "sha256-W8D3P/epehXW9pM1KBzFp8cgWfmXGN6S+ftdydamI0Q=";
  };
in
stdenv.mkDerivation rec {
  pname = "mangos-classic";
  version = "2025-04-11)";

  src = fetchFromGitHub {
    owner = "cmangos";
    repo = pname;
    rev = "fd03e05fbc2dbea7cf75ea6bcaefab41d748eea9";
    hash = "sha256-XRPmFh+P4oJyFTeIG5zSDi4m4KKXhyJomqhRUbc81HU=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    boost
    libmysqlclient
  ];

  hardeningDisable = [ "format" ];

  cmakeFlags = [
    "-DMYSQL_INCLUDE_DIR=${libmysqlclient.dev}/include/mysql"
    "-DBUILD_EXTRACTORS=ON"
    "-DBUILD_AHBOT=ON"
    "-DBUILD_PLAYERBOTS=ON"
  ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace-fail \
        "set(Boost_USE_STATIC_LIBS ON)" \
        "set(Boost_USE_STATIC_LIBS OFF)" \
      --replace-fail \
        "set(REVISION_ID \"Git repository not found\")" \
        "set(REVISION_ID \"${src.rev}\")"

    substituteInPlace src/CMakeLists.txt \
      --replace-fail "GIT_REPOSITORY \"https://github.com/cmangos/playerbots.git\"" "" \
      --replace-fail "GIT_TAG \"master\"" "URL ${playerbots}"
  '';

  meta = with lib; {
    homepage = "https://cmangos.net/";
    description = "C(ontinued)-MaNGOS (Classic fork) is about: -- Doing WoW-Emulation Right!";
    license = licenses.gpl2Plus;
    platforms = platforms.unix;
  };
}
