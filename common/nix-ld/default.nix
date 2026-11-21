{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = pkgs.steam-run.args.multiPkgs pkgs ++ (with pkgs; [
      alsa-lib
      dbus
      fontconfig
      freetype
      glibc
      icu
      libGL
      libglvnd
      libkrb5
      libpulseaudio
      libx11
      libxcb
      libxcursor
      libxext
      libxi
      libxinerama
      libxkbcommon
      libxrandr
      libxxf86vm
      lttng-ust_2_12
      mesa
      openssl
      stdenv.cc.cc
      udev
      vulkan-loader
      wayland
      zlib
    ]);
  };
}
