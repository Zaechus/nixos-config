{ appimageTools, fetchurl }:

appimageTools.wrapType2 rec {
  name = "thorium";
  version = "117.0.5938.157";

  src = fetchurl {
    url = "https://github.com/Alex313031/${name}/releases/download/M${version}/Thorium_Browser_${version}_x64.AppImage";
    hash = "sha256-dlfClBbwSkQg4stKZdSgNg3EFsWksoI21cxRG5SMrOM=";
  };
}
