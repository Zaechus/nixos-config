{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d1beb42b-41c9-4835-ae3f-82f15f545a5d";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/24680f74-1e97-4f78-b422-3483b6e2ce71";

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/d1beb42b-41c9-4835-ae3f-82f15f545a5d";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/d1beb42b-41c9-4835-ae3f-82f15f545a5d";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/d1beb42b-41c9-4835-ae3f-82f15f545a5d";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/C9D5-84CB";
      fsType = "vfat";
    };

  swapDevices = [ ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
