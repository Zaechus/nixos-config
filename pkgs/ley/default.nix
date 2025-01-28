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

  cargoHash = "sha256-8j0p5/0muAc4yjyD3XG4A0R3uYcIVa3Cc77Yepr2O20=";
}
