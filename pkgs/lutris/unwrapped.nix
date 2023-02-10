{ lib
, python3Packages
, fetchFromGitHub

, atk
, file
, fluidsynth
, gdk-pixbuf
, glib-networking
, glxinfo
, gnome-desktop
, gobject-introspection
, gst_all_1
, gtk3
, libnotify
, libstrangle
, p7zip
, pango
, pciutils
, psmisc
, pulseaudio
, vulkan-tools
, webkitgtk
, wine
, wrapGAppsHook
, xboxdrv
, xgamma
, xorg
, xorgserver
, xrandr
, xvfb-run
}:

let
  systemComponents = [
    fluidsynth
    glxinfo
    libstrangle
    p7zip
    pciutils
    psmisc
    pulseaudio
    vulkan-tools
    xgamma
    xrandr
    xboxdrv #
    wine #
    xorgserver #
    xorg.setxkbmap #
    xorg.xkbcomp #
  ];
  binPath = lib.makeBinPath systemComponents;
  gstDeps = with gst_all_1; [
    gst-libav
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    gstreamer
  ];
in
python3Packages.buildPythonApplication rec {
  pname = "lutris";
  version = "0.5.12";
  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-rsiXm7L/M85ot6NrTyy//lMRFlLPJYve9y6Erg9Ugxg=";
  };
  nativeBuildInputs = [ wrapGAppsHook ];
  buildInputs = [
    atk #
    gdk-pixbuf #
    glib-networking #
    gnome-desktop
    gobject-introspection
    gtk3
    libnotify #
    pango #
    webkitgtk
  ] ++ gstDeps;
  propagatedBuildInputs = with python3Packages; [
    certifi
    dbus-python
    distro
    evdev
    lxml
    pillow
    pygobject3
    pypresence
    pyyaml
    requests
    setproctitle
    keyring #
    # python-magic #
  ];

  postPatch = ''
    substituteInPlace lutris/util/magic.py \
      --replace "'libmagic.so.1'" "'${lib.getLib file}/lib/libmagic.so.1'"
    substituteInPlace lutris/runners/dosbox.py \
      --replace require_libs "# require_libs"
  '';

  checkInputs = [ python3Packages.nose2 xvfb-run ] ++ systemComponents;
  preCheck = "export HOME=$PWD";
  checkPhase = ''
    runHook preCheck
    ${xvfb-run}/bin/xvfb-run -s '-screen 0 1024x768x24' ${python3Packages.nose2}/bin/nose2
    runHook postCheck
  '';

  dontWrapGApps = true;
  makeWrapperArgs = [
    "--prefix PATH : ${binPath}"
    "\${gappsWrapperArgs[@]}"
  ];
  strictDeps = false;

  meta = with lib; {
    homepage = "https://lutris.net";
    description = "Open gaming platform for Linux";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
