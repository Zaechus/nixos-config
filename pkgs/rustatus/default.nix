{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-KY+RyvHDLaO7UyRCsjr5uaYHFZWSW/+TO6mYvY8mz7o=";
  };

  cargoHash = "sha256-PsBz6bNwpGbM2+uJqZmlX7Cui1rhYuwQr+uZrOlAZSs=";
}

