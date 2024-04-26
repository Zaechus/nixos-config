{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-t0SGi/VE6VVP3EC9pN2UEBDyNnHrOGOjmlLbIz/8TUE=";
  };

  cargoHash = "sha256-R+ncvz7fZ+cu86SMIue74Zp/V082tHIuJzCrFSxeDnE=";
}
