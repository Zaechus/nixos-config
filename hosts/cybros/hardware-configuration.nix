{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/6ac71b2f-5058-4908-949f-4e2a7db59119";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/816068d3-74aa-49a4-9c1f-a78933c8ae66";

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/6ac71b2f-5058-4908-949f-4e2a7db59119";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/6ac71b2f-5058-4908-949f-4e2a7db59119";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/6ac71b2f-5058-4908-949f-4e2a7db59119";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/655D-D8BD";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
