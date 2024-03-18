{ lib
, stdenv
, fetchFromGitHub

, gtest
, makeWrapper
, meson
, ninja
, pkg-config

, alsa-lib
, fluidsynth
, glib
, iir1
, libmt32emu
, libogg
, libpng
, libslirp
, opusfile
, SDL2
, SDL2_image
, SDL2_net
, speexdsp
}:

stdenv.mkDerivation rec {
  pname = "dosbox-staging";
  version = "0.81.0";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-NP/p/eHbRjfdMwQBC9OAL01pmlHDiYq2OO2KgFWHero=";
  };

  nativeBuildInputs = [
    gtest
    makeWrapper
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    alsa-lib
    fluidsynth
    glib
    libmt32emu
    libogg
    libpng
    libslirp
    opusfile
    SDL2
    SDL2_image
    SDL2_net
    speexdsp
    iir1
  ];

  NIX_CFLAGS_COMPILE = [
    "-I${SDL2_image}/include/SDL2"
    "-I${SDL2_net}/include/SDL2"
  ];

  enableParallelBuilding = true;

  postFixup = ''
    mv $out/bin/dosbox $out/bin/${pname}
    makeWrapper $out/bin/${pname} $out/bin/dosbox
  '';

  meta = with lib; {
    homepage = "https://dosbox-staging.github.io";
    description = "A modernized DOS emulator";
    license = licenses.gpl2Plus;
    platforms = platforms.unix;
  };
}
