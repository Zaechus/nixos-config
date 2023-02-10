{ lib, fetchFromGitLab, python3Packages }:

python3Packages.buildPythonPackage rec {
  pname = "vkbasalt-cli";
  version = "3.1.1";

  src = fetchFromGitLab {
    owner = "TheEvilSkeleton";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-4MFqndnvwAsqyer9kMNuCZFP/Xdl7W//AyCe7n83328=";
  };

  meta = with lib; {
    homepage = "https://gitlab.com/TheEvilSkeleton/vkbasalt-cli";
    description = "Command-line utility for vkBasalt";
    license = with licenses; [ gpl3Plus lgpl3Plus ];
    platforms = platforms.linux;
  };
}
