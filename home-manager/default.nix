{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    shellAliases = {
      btm = "btm --battery -R";
      diff = "diff --color";
      doas = "sudo";
      l = "exa --icons --color=always";
      ll = "l -aalg";
      lisosort = "exa -lRs size --no-permissions --no-user --no-time ~/images/disk/**/*.iso";
      pp = "ping 1.1.1.1";
      sc2cfg = "swaymsg input type:keyboard repeat_rate 150 && swaymsg input type:keyboard repeat_delay 150";
      unsc2 = "swaymsg input type:keyboard repeat_rate 25 && swaymsg input type:keyboard repeat_delay 300";
      watch = "watch -c -n 1 ";
      batworld = "sed \"s/.*\///g\" /var/lib/portage/world | sort | bat";
      qemu-boot-bios = "qemu-system-x86_64 -enable-kvm -cpu host -smp 12 -m 8G -vga virtio --display gtk,full-screen=on,show-cursor=on";
      qemu-boot = "qemu-boot-bios -drive if=pflash,format=raw,unit=0,readonly=on,file=/usr/share/edk2-ovmf/OVMF_CODE.fd -drive if=pflash,format=raw,unit=1,file=OVMF_VARS.fd";
    };
  };
}
