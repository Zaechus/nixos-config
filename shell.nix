{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    inxi dmidecode smartmontools glxinfo file
  ];
  shellHook = ''
    sudo inxi -c2Fzv8 | bat
  '';
}
