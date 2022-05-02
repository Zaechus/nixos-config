{ pkgs, rustPlatform, fetchCrate, ... }:

with import <nixpkgs> {};

rustPlatform.buildRustPackage rec {
  pname = "zinfo";
  version = "0.2.3";

  src = fetchCrate {
    inherit pname version;
    sha256 = "0vfgajhkwxi1471b1yvmz5vfb0p703kpglsbh8g1bzk71y5jy5jm";
  };

  cargoSha256 = "0j5z1g9z4lqi92crid75c9labvxag5zgnh7b6706ckdjzs0985v8";

  doCheck = false; # skip tests

  meta = with lib; {
    description = "A cross-platform system information program";
    homepage = "https://github.com/Zaechus/zinfo";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
