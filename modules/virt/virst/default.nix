{ rustPlatform, ... }:

rustPlatform.buildRustPackage rec {
  name = "virst";
  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
