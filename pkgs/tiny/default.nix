{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tiny";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "osa1";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-phjEae2SS3zkSpuhhE4iscUM8ij8DT47YLIMATMG/+Q=";
  };

  cargoHash = "sha256-DvFrRH6wObMvkRxS8vh3tlCrZNAiuZHfN0ARagMfG2k=";

  meta = with lib; {
    description = "A terminal IRC client written in Rust";
    homepage = "https://github.com/osa1/tiny";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
