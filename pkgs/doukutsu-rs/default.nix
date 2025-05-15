{ lib
, rustPlatform
, fetchFromGitHub
, cmake
, pkg-config
, alsa-lib
, SDL2
, SDL2_image
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
  version = "0.102.0-beta7";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    hash = "sha256-Gi58pGNs5u+tPIiPbprUxgj16vkOU73v19bG6/eR200=";
  };

  cargoHash = "sha256-++rb+jzeQORYrX1vXFb6RQH30ccVoNQD/znZmZOqn5U=";

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    alsa-lib
    SDL2
    SDL2_image
  ];

  buildNoDefaultFeatures = true;
  buildFeatures = [
    "default-base"
    "backend-sdl"
    "render-opengl"
    "exe"
  ];

  doCheck = false;

  postPatch = ''
    substituteInPlace Cargo.toml \
      --replace-fail \
        'sdl2 = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true, features = ["unsafe_textures", "bundled", "static-link"] }' \
        'sdl2 = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true, features = ["unsafe_textures"] }' \
      --replace-fail \
        'sdl2-sys = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true, features = ["bundled", "static-link"] }' \
        'sdl2-sys = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true }' \
      --replace-fail \
        'sdl2 = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true, features = ["image", "unsafe_textures", "bundled", "static-link"] }' \
        'sdl2 = { git = "https://github.com/doukutsu-rs/rust-sdl2.git", rev = "f2f1e29a416bcc22f2faf411866db2c8d9536308", optional = true, features = ["image", "unsafe_textures"] }'
  '';

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
