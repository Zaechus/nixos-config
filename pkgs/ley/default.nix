{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "ley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Zaechus";
    repo = pname;
    rev = "refs/heads/main";
    hash = "sha256-zp+1AZv2dYaB5uaKQqUG/VdfC7PvteSe0T4RcmD0fJs=";
  };

  cargoHash = "sha256-zQc2GUaPDcmNnMVS6MisZ/GfyVIiMrTvMj7bGHMa+O4=";
}
