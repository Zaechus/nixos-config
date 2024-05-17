{ rustPlatform, fetchCrate }:

rustPlatform.buildRustPackage rec {
  pname = "xdvdfs-cli";
  version = "0.7.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-qeTqn9EX/pEc7Pfs0swWNRNk2wQVVQwxAxnXpc6NKIE=";
  };

  cargoHash = "sha256-t6HgaC8c5DeQ2zRy/c33S/0TdDJInmAaDZBgoLBy4rI=";
}
