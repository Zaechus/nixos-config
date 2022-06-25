{ pkgs, lib, rustPlatform, fetchCrate, ... }:

with import <nixpkgs> {};

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.2.4";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-iL0+PimZFa3LHqbJk80FH3j2i2BQCmfgQd7V72zrHFo=";
  };

  cargoHash = "sha256-Xbgrb3LGH1JvZpMgE9idUcC0dvgRs80Cstngr9zUf8I=";

  doCheck = false; # skip tests

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
