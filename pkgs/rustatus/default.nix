{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-KFCKzmXBmoxMXpHJJPkN1SxmOBNVxCGwnCobE9L5kHg=";
  };

  cargoHash = "sha256-JdyRCWMnELat29oBmmkaihhRXFU1E6KUSokFHgFfSxc=";
}

