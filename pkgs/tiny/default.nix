{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tiny";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "osa1";
    repo = pname;
    rev = "b473bce15be4d04c65cb5315c3f25bb991752274";
    hash = "sha256-GRL8bRW0lP9OWrM+n3D0xdombY4UJNvwvFVQr+AiL/A=";
  };

  cargoHash = "sha256-EG1BtiHHFHE9/Q4ds1evFKDUCHqvjoL2PqS8o8e7ai4=";

  meta = with lib; {
    description = "A terminal IRC client written in Rust";
    homepage = "https://github.com/osa1/tiny";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
