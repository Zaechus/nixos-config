{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-FAHBJnwl5V2v0TpwqOKy+Nz9H5OATgX7tMckB2wG/i4=";
  };

  cargoHash = "sha256-OBCMTcinHOP9s7DKiiiF14q9IX7PoZnyf4GcVjO7k9w=";
}

