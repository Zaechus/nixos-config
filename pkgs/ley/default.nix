{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-EggOyjti+sAv7TemVj2Qaz6E2+faC5gkfjhR8KbA54k=";
  };

  cargoHash = "sha256-xBKbLSgHsnxSO9s2iFDgt7a+sa1PNTG0OagGpZuxau4=";
}
