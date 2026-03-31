{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  python3,
  dbus-glib,
  glib,
  libX11,
  libusb1,
}:

stdenv.mkDerivation rec {
  pname = "xboxdrv";
  version = "0.8.8";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "c707289a74a7194d3a06295d96d7a4c12e8de8b9";
    hash = "sha256-UfmSN3JqziSvHvPdovpHctXCi7v/8yquMNKlmeP4NbM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    python3
  ];

  buildInputs = [
    dbus-glib
    glib
    libusb1
    libX11
    (python3.withPackages (p: [
      p.dbus-python
    ]))
  ];

  meta = with lib; {
    description = "Xbox/Xbox360 USB Gamepad Driver for Userspace";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
