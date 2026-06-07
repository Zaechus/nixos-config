{ lib
, rustPlatform
, fetchFromGitHub
, cmake
, pkg-config
, alsa-lib
, SDL2
}:

let
  gameData = fetchFromGitHub {
    owner = "doukutsu-rs";
    repo = "game-data";
    rev = "f08e35952f2d9358f6591984d5870e7312492999";
    hash = "sha256-omBi2IzCSxyR1WMe4NUfiLc0PRIVdEp/igk3Vv0hM0c=";
  };
in
rustPlatform.buildRustPackage rec {
  pname = "doukutsu-rs";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    hash = "sha256-iVW7IvUhz+3wXmRsC75Jlo2g4fvoIlAoGavPMQ78f3Q=";
  };

  cargoHash = "sha256-uK9TkRXp19+29o+vHQ/jAKIOL67l/pHzT55F77IwdkI=";

  cargoPatches = [
    ./sdl2.patch
  ];

  buildNoDefaultFeatures = true;
  buildFeatures = [
    "default-base"
    "backend-sdl"
    "render-opengl"
    "exe"
  ];

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    alsa-lib
    SDL2
  ];

  doCheck = false;

  postInstall = ''
    ln -s ${gameData} $out/bin/data
  '';

  meta = with lib; {
    homepage = "https://doukutsu.rs/";
    description = "A faithful and open-source remake of Cave Story's engine written in Rust";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
