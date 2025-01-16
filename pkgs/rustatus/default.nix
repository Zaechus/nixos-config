{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-7fqAwaD3YEzwvjfZYANXXHADKQ1IOB4RcVvNI4swcc8=";
  };

  cargoHash = "sha256-JdyRCWMnELat29oBmmkaihhRXFU1E6KUSokFHgFfSxc=";
}

