{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-1c+H5VUuH5cfqu+mx65Jb9V2/C6MJEnDD47J+E/L3nQ=";
  };

  cargoHash = "sha256-t8MwqG5F7yvvqAHBgZZSdpiRRS1q9kD6zaVMX/inUN8=";
}
