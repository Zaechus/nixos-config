{ rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "xdvdfs-cli";
  version = "0.8.3";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-EQQzsMsoUeMC71D3rUKs7iV6PnOeIllhTsXJFW+qKtM=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-UIAmdXF92iEPIE2DyRN1Rw2adugsEAGy00kUQ2Fp6M8=";
}
