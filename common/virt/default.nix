{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
  };
  programs.virt-manager.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];
  environment.systemPackages = with pkgs; [
    virtio-win
  ];
}
