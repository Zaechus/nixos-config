{ lib, rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.2.5";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-7NE3awQkt3wWHsJ9BymUkmbzWjAhbsCckjB7UVRSEiM=";
  };

  cargoHash = "sha256-blhjz1qyr9rH6W4Umzn6DFHYs0lC4U6tEEQ8GhByyN0=";

  doCheck = false;

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
