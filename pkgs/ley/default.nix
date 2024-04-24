{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-oIjniddnPoUxV4XAPoPt4ipLmVkwxyzfd4RjNAG+3Dw=";
  };

  cargoHash = "sha256-R+ncvz7fZ+cu86SMIue74Zp/V082tHIuJzCrFSxeDnE=";
}
