{ buildFHSUserEnv, callPackage }:

let
  lutris-unwrapped = callPackage ./unwrapped.nix { };
  xorgDeps = pkgs: with pkgs.xorg; [
    libX11
    libXrender
    libXrandr
    libxcb
    libXmu
    libpthreadstubs
    libXext
    libXdmcp
    libXxf86vm
    libXinerama
    libSM
    libXv
    libXaw
    libXi
    libXcursor
    libXcomposite
  ];
in
buildFHSUserEnv {
  name = "lutris";

  runScript = "lutris";

  targetPkgs = pkgs: with pkgs; [
    lutris-unwrapped

    # DOSBox
    opusfile
    SDL2_net

    # GNOME
    gnome.zenity
    gtksourceview
    gnome-desktop
    gnome.libgnome-keyring
    webkitgtk

    # GOG
    glib-networking

    # QT
    qt5.qtbase
    qt5.qtmultimedia

    # WINE
    xorg.xrandr
    perl
    which
    p7zip
    gnused
    gnugrep
    psmisc
    opencl-headers

    #
    libunwind
    nss
  ];

  multiPkgs = pkgs: with pkgs; [
    alsa-lib
    freetype
    glib
    gnutls
    libGL
    libpulseaudio
    SDL2
    vulkan-loader

    # Common
    libsndfile
    libtheora
    libogg
    libvorbis
    libopus
    libGLU
    libpcap
    libao
    libevdev
    udev
    libgcrypt
    libxml2
    libusb-compat-0_1
    libpng
    libmpeg2
    libv4l
    libjpeg
    libxkbcommon
    libass
    libcdio
    libjack2
    libsamplerate
    libzip
    libmad
    libaio
    libcap
    libtiff
    libva
    libgphoto2
    libxslt
    libsndfile
    giflib
    zlib
    zziplib
    bash
    dbus
    keyutils
    zip
    cabextract
    unzip
    coreutils
    readline
    gcc
    SDL
    curl
    graphite2
    gtk2
    gtk3
    udev
    ncurses
    wayland
    libglvnd
    xdg-utils
    sqlite
    p11-kit
    libbsd
    harfbuzz

    # Proton
    libselinux

    # WINE
    cups
    lcms2
    mpg123
    cairo
    unixODBC
    samba4
    sane-backends
    openldap
    ocl-icd
    util-linux
    libkrb5

    # Winetricks
    fribidi
  ] ++ xorgDeps pkgs;

  extraInstallCommands = ''
    mkdir -p $out/share
    ln -sf ${lutris-unwrapped}/share/applications $out/share
    ln -sf ${lutris-unwrapped}/share/icons $out/share
  '';

  # unshareIpc = false;
  # unsharePid = false;

  meta = {
    inherit (lutris-unwrapped.meta)
      homepage
      description
      license
      platforms;
    mainProgram = "lutris";
  };
}
