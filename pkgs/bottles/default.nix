{ lib
, fetchFromGitHub
, gitUpdater

, appstream-glib
, blueprint-compiler
, cabextract
, desktop-file-utils
, freetype
, gamemode
, gdk-pixbuf
, gettext
, glib
, gnome
, gobject-introspection
, gsettings-desktop-schemas
, gspell
, gtk3
, gtk4
, gtksourceview5
, imagemagick
, libadwaita
, libhandy
, libnotify
, mangohud
, meson
, my
, ninja
, p7zip
, pciutils
, pkg-config
, python3Packages
, steam
, webkitgtk
, wine
, wrapGAppsHook
, xdg-utils
, xdpyinfo
}:

let
  steam-run = (steam.override {
    extraLibraries = pkgs: with pkgs; [ libunwind libusb1 gnutls ];
    extraPkgs = pkgs: [ ];
  }).run;
in
python3Packages.buildPythonApplication rec {
  pname = "bottles";
  version = "50.2";

  src = fetchFromGitHub {
    owner = "bottlesdevs";
    repo = pname;
    rev = version;
    sha256 = "sha256-+r/r3vExnvYQIicKAEmwZ+eRSep6kWte5k7gu9jC67w=";
  };

  postPatch = ''
    chmod +x build-aux/meson/postinstall.py
    patchShebangs build-aux/meson/postinstall.py

    substituteInPlace bottles/backend/wine/winecommand.py --replace \
      'self.__get_runner()' \
      '"${steam-run}/bin/steam-run " + self.__get_runner()'
  '';

  nativeBuildInputs = [
    appstream-glib
    desktop-file-utils
    gettext
    meson
    ninja
    pkg-config
    wrapGAppsHook
  ];

  buildInputs = [
    blueprint-compiler
    gdk-pixbuf
    glib
    gobject-introspection
    gsettings-desktop-schemas
    gspell
    gtk3
    gtk4
    gtksourceview5
    libadwaita
    libhandy
    libnotify
    webkitgtk
    gnome.adwaita-icon-theme
  ];

  propagatedBuildInputs = with python3Packages; [
    dbus-python
    gst-python
    liblarch
    lxml
    markdown
    patool
    pycairo
    pycurl
    pygobject3
    pytoml
    pyyaml
    requests
  ] ++ [
    cabextract
    freetype
    # gamemode # programs.gamemode.enable
    imagemagick
    mangohud
    my.fvs
    my.icoextract
    my.vkbasalt-cli
    p7zip
    pciutils
    steam-run
    wine
    xdg-utils
    xdpyinfo
  ];

  format = "other";
  strictDeps = false;

  dontWrapGApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';

  passthru.updateScript = gitUpdater { };

  meta = with lib; {
    description = "An easy-to-use wineprefix manager";
    homepage = "https://usebottles.com";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
