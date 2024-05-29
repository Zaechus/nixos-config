{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-XQvcHLVX1WX2XgxhqXqISTlfclpuIf/2m1c1EfJAyBg=";
  };

  cargoHash = "sha256-sBXSRGgmPBJQu6odEloCGxVIKVHPBVRZhkJCIg3DoPM=";
}
