{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    (callPackage ./virst { })
  ];

  environment.etc = {
    "ovmf/OVMF_CODE.fd".source = "${config.virtualisation.libvirtd.qemu.package}/share/qemu/edk2-x86_64-code.fd";
    "ovmf/OVMF_VARS.fd".source = "${config.virtualisation.libvirtd.qemu.package}/share/qemu/edk2-i386-vars.fd";
  };
}
