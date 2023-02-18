{ lib
, stdenv
, fetchFromGitHub
, cmake
, glew
, libdevil
, pkg-config
, rtaudio
, rtmidi
, SDL2
}:

stdenv.mkDerivation rec {
  pname = "TheForceEngine";
  version = "1.09.100";

  src = fetchFromGitHub {
    owner = "luciusDXL";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-nw9yp/StaSi5thafVT1V5YA2ZCYGWNoHUvQTpK90Foc=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    glew
    libdevil
    rtaudio
    rtmidi
    SDL2
  ];

  postPatch = ''
    substituteInPlace TheForceEngine/TFE_FileSystem/paths-posix.cpp \
      --replace /usr/share $out/share
  '';

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://theforceengine.github.io";
    description = "Modern Jedi Engine replacement";
    license = licenses.gpl2Only;
    platforms = platforms.linux;
  };
}
