{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "rustatus";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-HRnmGfdWx+M84u6lbchrdPPomBbqRnoCB26sAjbbQC8=";
  };

  cargoHash = "sha256-XSKNXMwqLB/NjsmArA0m2uROf5tjSAlRATHk0dTuqRY=";
}

