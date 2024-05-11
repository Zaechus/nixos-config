{ appimageTools, fetchurl }:

appimageTools.wrapType2 {
  name = "rpcs3";
  version = "0.0.32-16434";

  src = fetchurl {
    url = "https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-7ac097255e29b38bb041a080f750300a6e78812d/rpcs3-v0.0.32-16434-7ac09725_linux64.AppImage";
    hash = "sha256-IQO+ciSET4VwlQRuiiNpZloF5yokfopNgW5kqlY7Jik=";
  };
}
