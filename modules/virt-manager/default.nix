{ pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];

  environment.shellAliases = {
    qemu-boot-bios = "qemu-system-x86_64 -enable-kvm -cpu host -smp 12 -m 8G -vga virtio --display gtk,full-screen=on,show-cursor=on";
    qemu-boot = "qemu-boot-bios -drive if=pflash,format=raw,unit=0,readonly=on,file=/usr/share/edk2-ovmf/OVMF_CODE.fd -drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd";
  };
}
