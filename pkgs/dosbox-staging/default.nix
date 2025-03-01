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
, libXi
, opusfile
, SDL2
, SDL2_image
, SDL2_net
, speexdsp
, zlib-ng
}:

stdenv.mkDerivation rec {
  pname = "dosbox-staging";
  version = "0.81.2";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-gErfJDQKpf0q4v3NHL+Yr+cBg+AbemqqNpksZx3DPMk=";
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
    iir1
    libmt32emu
    libogg
    libpng
    libslirp
    libXi
    opusfile
    SDL2
    SDL2_image
    SDL2_net
    speexdsp
    zlib-ng
  ];

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
