{ rustPlatform, ... }:

rustPlatform.buildRustPackage {
  name = "virst";
  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
