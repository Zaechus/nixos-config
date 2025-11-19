{
  lib,
  rustPlatform,
  fetchFromGitLab,
  autoPatchelfHook,
  cargo,
  ffmpeg,
  libgbm,
  llvmPackages,
  lz4,
  meson,
  ninja,
  pkg-config,
  rust-bindgen,
  rustc,
  scdoc,
  shaderc,
  vulkan-headers,
  vulkan-loader,
  wayland-scanner,
  zstd,
}:

llvmPackages.stdenv.mkDerivation (finalAttrs: {
  pname = "waypipe";
  version = "0.10.5";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "mstoeckl";
    repo = "waypipe";
    rev = "d747055eb0f74b47d1a6d583d05e661268655727";
    hash = "sha256-UPTPiZUiFsJbFNM2ZQB0fs9+uuOHZ7DPOHTTYN9tw7c=";
  };
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-6+DTbFjHdeC10XSN3t6NEyyHmSgCuib1IFjbq15indU=";
  };

  strictDeps = true;
  LIBCLANG_PATH = "${llvmPackages.libclang.lib}/lib";
  depsBuildBuild = [ pkg-config ];

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    scdoc
    cargo
    shaderc # for glslc
    rustc
    wayland-scanner
    rustPlatform.cargoSetupHook
    autoPatchelfHook
    rust-bindgen
  ];

  buildInputs = [
    libgbm
    lz4
    zstd
    ffmpeg
    vulkan-headers
    vulkan-loader
  ];

  runtimeDependencies = [
    libgbm
    ffmpeg.lib
    vulkan-loader
  ];

  meta = {
    description = "Network proxy for Wayland clients";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "waypipe";
  };
})
