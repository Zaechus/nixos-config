{ lib, rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.3.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-29yRRxCcZ6pVdRu+cZ3fnsy0OmvzhEUflmQMVeDIeUk=";
  };

  cargoHash = "sha256-7j+EtUdN95oBZZR6sjOPOdKAGUr4tHZT0mh6vzOpPhE=";

  doCheck = false;

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
