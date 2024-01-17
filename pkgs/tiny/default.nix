{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tiny";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "osa1";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-VlKhOHNggT+FbMvE/N2JQOJf0uB1N69HHdP09u89qSk=";
  };

  cargoHash = "sha256-rGsGPiZ3b4KRywzlJm/u+1BRBq5oECe6gDOVLUHjCzo=";

  meta = with lib; {
    description = "A terminal IRC client written in Rust";
    homepage = "https://github.com/osa1/tiny";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
