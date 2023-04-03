{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-YxJ+/coqkKocE/czZbmIq25TCn+2aO6aB4WyebHJbhM=";
  };

  cargoHash = "sha256-NpVCKsCXqpuv+gSWpIHp28g/07F219cGi94yGxBbR5s=";
}

