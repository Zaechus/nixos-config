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
, libGL
, libmt32emu
, libogg
, libpng
, libslirp
, libX11
, libXi
, opusfile
, SDL2
, SDL2_net
, speexdsp
, zlib-ng
}:

stdenv.mkDerivation rec {
  pname = "dosbox-staging";
  version = "0.82.1";
  shortRev = "13441a2";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-BVeFBKqTQiEftWVvMkSYBjC6dCYI4juWD4A6Bx8E8/Y=";
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
    libGL
    libmt32emu
    libogg
    libpng
    libslirp
    libX11
    libXi
    opusfile
    SDL2
    SDL2_net
    speexdsp
    zlib-ng
  ];

  postPatch = ''
    substituteInPlace meson.build \
      --replace-fail "meson.project_source_root() + '/scripts/get-version.sh'," "'printf'," \
      --replace-fail "'version', check: true," "'${version}', check: true," \
      --replace-fail "'./scripts/get-version.sh', 'hash'," "'printf', '${builtins.substring 0 5 shortRev}',"
  '';

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
