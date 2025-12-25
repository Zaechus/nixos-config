{
  lib,
  stdenv,
  fetchurl,
  buildPackages,
  perl,
}:

# https://github.com/NixOS/nixpkgs/blob/33a73886c4eaccbe407112e26d378383ba0f0171/pkgs/development/libraries/openssl/default.nix
stdenv.mkDerivation rec {
  pname = "openssl";
  version = "1.0.2u";

  src = fetchurl {
    url = "https://www.openssl.org/source/${pname}-${version}.tar.gz";
    sha256 = "ecd0c6ffb493dd06707d38b14bb4d8c2288bb7033735606569d8f90f89669d16";
  };

  postPatch = ''
    patchShebangs Configure
    patchShebangs test/*
    for a in test/t* ; do
      substituteInPlace "$a" \
        --replace /bin/rm rm
    done
  '';

  outputs = [ "bin" "dev" "out" "man" ];
  setOutputFlags = false;
  separateDebugInfo =
    !(stdenv.hostPlatform.useLLVM or false) &&
    stdenv.cc.isGNU;

  nativeBuildInputs = [ perl ];

  configurePlatforms = [];
  configureScript = {
      x86_64-linux = "./Configure linux-x86_64";
    }.${stdenv.hostPlatform.system} or (
      if stdenv.hostPlatform == stdenv.buildPlatform
        then "./config"
      else if stdenv.hostPlatform.isLinux
        then "./Configure linux-generic${toString stdenv.hostPlatform.parsed.cpu.bits}"
      else
        throw "Not sure what configuration to use for ${stdenv.hostPlatform.config}"
    );

  dontAddStaticConfigureFlags = true;
  configureFlags = [
    "shared"
    "--libdir=lib"
    "--openssldir=etc/ssl"
  ];

  makeFlags = [
    "MANDIR=$(man)/share/man"
    "MANSUFFIX=ssl"
  ];

  postInstall = ''
    substituteInPlace $out/bin/c_rehash --replace ${buildPackages.perl}/bin/perl "/usr/bin/env perl"
    mkdir -p $bin
    mv $out/bin $bin/bin

    mkdir $dev
    mv $out/include $dev/

    rm -r $out/etc/ssl/misc

    rmdir $out/etc/ssl/{certs,private}
  '';

  postFixup = ''
    if grep -r '${buildPackages.perl}' $out; then
      echo "Found an erroneous dependency on perl ^^^" >&2
      exit 1
    fi
  '';

  meta = with lib; {
    homepage = "https://www.openssl.org/";
    description = "A cryptographic library that implements the SSL and TLS protocols";
    license = licenses.openssl;
    platforms = platforms.all;
  };
}
