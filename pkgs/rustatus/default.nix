{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-wev2niXn9Z5MzWT59Kl8q82eU/lhNZY9hABHNqmD8oI=";
  };

  cargoHash = "sha256-NpVCKsCXqpuv+gSWpIHp28g/07F219cGi94yGxBbR5s=";
}

