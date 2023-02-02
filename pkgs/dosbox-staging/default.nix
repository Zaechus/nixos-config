{ stdenv
, fetchFromGitHub
, makeWrapper
, meson
, ninja
, pkg-config
, alsa-lib
, fluidsynth
, glib
, libmt32emu
, libogg
, libpng
, libslirp
, opusfile
, SDL2
, SDL2_image
, SDL2_net
, speexdsp
, my
}:

stdenv.mkDerivation rec {
  pname = "dosbox-staging";
  version = "0.80.1";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-I90poBeLSq1c8PXyjrx7/UcbfqFNnnNiXfJdWhLPGMc=";
  };

  nativeBuildInputs = [
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
    my.iir1
  ];

  NIX_CFLAGS_COMPILE = [
    "-I${SDL2_image}/include/SDL2"
    "-I${SDL2_net}/include/SDL2"
  ];

  configurePhase = ''
    meson setup --wrap-mode=nodownload build/release
  '';

  enableParallelBuilding = true;

  buildPhase = ''
    meson compile -C build/release
  '';

  installPhase = ''
    meson install -C build/release --destdir $out
    mkdir -p $out/bin
    ln -s $out/usr/local/bin/dosbox $out/bin/dosbox
  '';

  postFixup = ''
    mv $out/bin/dosbox $out/bin/${pname}
    makeWrapper $out/bin/dosbox-staging $out/bin/dosbox
  '';
}
