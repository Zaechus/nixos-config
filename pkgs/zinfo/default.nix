{ lib, rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.3.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-29yRRxCcZ6pVdRu+cZ3fnsy0OmvzhEUflmQMVeDIeUk=";
  };

  cargoHash = "sha256-1LZ524xRTUg/eDhgTWsK4l1Z//H2HsWIgf2kJohXFlk=";

  doCheck = false;

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
