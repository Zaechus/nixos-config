{ lib, rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.3.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-KXE1/eBSpIWNUnD+e6cZdv0p/+VxWfgrH68KcnCfz3I=";
  };

  cargoHash = "sha256-Gh5PVJkFkLgsRASinLeJoBlDjP3BFQABqMNvYZIv8vs=";

  doCheck = false;

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
