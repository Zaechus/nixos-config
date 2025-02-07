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

  useFetchCargoVendor = true;
  cargoHash = "sha256-LN/QAuGdJMsyfkaToThCjkaHyrZa4Mpkr29YSE3PRIk=";
}

