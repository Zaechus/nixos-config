{ config, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1da2e922-4ffa-40f0-8c20-dda5eda5f5ce";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/1844306a-42eb-412a-8d3c-0bcbaf292ebf";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/1da2e922-4ffa-40f0-8c20-dda5eda5f5ce";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/1da2e922-4ffa-40f0-8c20-dda5eda5f5ce";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/1da2e922-4ffa-40f0-8c20-dda5eda5f5ce";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/5F2D-E9F9";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
