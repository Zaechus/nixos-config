{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
  ];

  environment.etc = {
    "qemu/OVMF.fd".source = "${pkgs.qemu}/share/qemu/edk2-x86_64-code.fd";
  };
}
