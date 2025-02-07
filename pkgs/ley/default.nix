{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-41sdhk6phGwdZhMSUJxeCR11B8WiHrL7GrU53nIW4II=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-Gg8rDvd7UyePZuQOMyZx0itcYku74mi95VEXHKdiYtQ=";
}
