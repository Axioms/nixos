{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  zramSwap = {
    enable = true;
    memoryMax = 1024 * 1024 * 1024;
  };

hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "uas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/62353844-37e5-4a07-867c-0cc880236b81";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-36bd6fb7-a9d0-443b-9fa1-2a3bb03843c7".device = "/dev/disk/by-uuid/36bd6fb7-a9d0-443b-9fa1-2a3bb03843c7";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A464-6D14";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
