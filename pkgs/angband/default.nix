{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, ncurses
}:

stdenv.mkDerivation rec {
  pname = "angband";
  version = "4.2.5";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "sha256-Fp3BGCZYYdQCKXOLYsT4zzlibNRlbELZi26ofrbGGPQ=";
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ ncurses ];

  installFlags = [ "bindir=$(out)/bin" ];

  # https://github.com/angband/angband/issues/5264
  postFixup = ''
    echo "" > $out/etc/angband/customize/keys-gcu.prf
  '';

  meta = with lib; {
    homepage = "https://angband.github.io/angband";
    description = "A single-player roguelike dungeon exploration game";
    license = licenses.gpl2Plus;
  };
}
