{ lib
, stdenv
, fetchFromGitHub
, cmake
, glew
, libX11
, pkg-config
, rtaudio
, rtmidi
, SDL2
, SDL2_image
}:

stdenv.mkDerivation rec {
  pname = "TheForceEngine";
  version = "1.22.420";

  src = fetchFromGitHub {
    owner = "luciusDXL";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-8JhaCIJgyaikoDLesshKiIhOO6OFis0xBYDq4vio4F4=";
  };

  hardeningDisable = [ "format" ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    glew
    libX11
    rtaudio
    rtmidi
    SDL2
    SDL2_image
  ];

  postPatch = ''
    substituteInPlace TheForceEngine/TFE_FileSystem/paths-posix.cpp \
      --replace-fail "/usr/share" "$out/share"
  '';

  meta = with lib; {
    homepage = "https://theforceengine.github.io";
    description = "Modern Jedi Engine replacement";
    license = licenses.gpl2Only;
    platforms = platforms.linux;
  };
}
