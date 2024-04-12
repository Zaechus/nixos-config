{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-ZefB4CQH5Uk7V36MNFnNM8ylhC2ckKwMRy1pi8u0kiY=";
  };

  cargoHash = "sha256-xBKbLSgHsnxSO9s2iFDgt7a+sa1PNTG0OagGpZuxau4=";
}
