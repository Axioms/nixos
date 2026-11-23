{
  config,
  lib,
  modulesPath,
  inputs,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  zramSwap = {
    enable = true;
    memoryMax = (1024 * 1024 * 1024) * 10;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };
  };

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci_renesas"
        "thunderbolt"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "ahci"
        "xhci_pci"
        "sr_mod"
      ];
      kernelModules = [
        "vfio-pci"
        "vfio"
        "vfio_iommu_type1"
        "kvm_amd"
        "kvm"
        "dm-snapshot"
        "cryptd"
      ];

      luks.devices."luks-ccff488b-f9ae-4b7f-a78f-5083655bb5fe".device =
        "/dev/disk/by-uuid/ccff488b-f9ae-4b7f-a78f-5083655bb5fe";
    };
    loader.systemd-boot.consoleMode = "max";

    kernelModules = [
      "kvm-amd"
      "kvmfr"
    ];

    extraModprobeConfig = ''
      #softdep nouveau pre: vfio-pci
      #softdep nvidia pre: vfio-pci
      #softdep nvidia* pre: vfio-pci
      options kvm_amd nested=1
      options kvm ignore_msrs=1
      #options vfio-pci ids=10de:2482,1458:408f,10de:228b,1458:408f,1912:0014
      #options kvmfr static_size_mb=256
      options snd-hda-intel model=pch position_fix=6
    '';

    extraModulePackages = [ config.boot.kernelPackages.kvmfr ];
    kernelParams = [
      #"amd_iommu=on"
      #"iommu=pt"
      #"intremap=no_x2apic_optout"
      "rootfstype=ext4"
      "video=efifb:off"
      "loglevel=3"
      "udev.log_priority=3"
      "xhci_hcd.quirks=270336"
      "transparent_hugepage=never"
      #"rd.driver.pre=vfio-pci"
      #"pcie_acs_override=downstream,multifunction"
      #"vfio-pci.ids=10de:2482,10de:228b,1912:0014"
      #"ipv6.disable=1"
      #"video=DP-3:1920x1080"
      #"video=DP-1:3840x2160@120"
      #"video=HDMI-A-1:3840x2160@60"
      "amdgpu.lockup_timeout=1000"
      "amdgpu.noretry=0"
      "usbcore.autosuspend=-1"
    ];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/0fbaae9a-a8b7-4490-bb00-a3a67d11f426";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/6076-5A43";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
    "/mnt/data" = {
      device = "/dev/disk/by-uuid/cf7488e9-4f32-4454-aee0-d4bc7383e551";
      fsType = "ext4";
    };
    "/mnt/gamesSlow" = {
      device = "/dev/disk/by-uuid/cc907d4c-689e-4efa-9416-0c4af05f692a";
      fsType = "xfs";
    };
    "/home" = {
      device = "/dev/disk/by-uuid/63d5edb1-b3f1-4525-99ed-659304e4005e";
      fsType = "ext4";
    };
    "/mnt/libvirt" = {
      device = "/dev/disk/by-uuid/0b434c3c-70a0-4ba6-bc30-1e3adc765c28";
      fsType = "ext4";
    };
    "/mnt/games" = {
      device = "/dev/disk/by-uuid/5ea72c65-21cd-482b-a465-f9e7bff12cdf";
      fsType = "xfs";
    };
  };

  swapDevices = [ ];

  age.secrets = {
    ainstsda1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/ainstsda1.key.age";
    };

    ainstsdb1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/ainstsdb1.key.age";
    };

    ainstsdc1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/ainstsdc1.key.age";
    };

    ainstsdd1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/ainstsdd1.key.age";
    };

    ainstsde1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/ainstsde1.key.age";
    };

    nvme2n1p1-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/nvme2n1p1.key.age";
    };

    GameDrive-Virgo-key = {
      owner = "root";
      mode = "400";
      rekeyFile = "${inputs.secrets}/Virgo/disks/GameDrive.key.age";
    };
  };

  environment.etc.crypttab = {
    mode = "0600";
    text = ''
      # <volume-name> <encrypted-device> [key-file] [options]
      #ainstsdd1 UUID=0201b90d-c3e2-4e0b-81a1-b0bf73b21007 ${config.age.secrets.ainstsdd1-Virgo-key.path} luks,key-slot=1
      ainstsdb1 UUID=e5ea3b7f-edfe-4aab-999c-d49b54bab21b ${config.age.secrets.ainstsdb1-Virgo-key.path} luks,key-slot=1
      ainstsde1 UUID=6adad7da-3bb9-4ffa-895f-8ddc5e26e0e1 ${config.age.secrets.ainstsde1-Virgo-key.path} luks,key-slot=1
      ainstsda1 UUID=c6dd47e2-cf00-4b22-8390-b08f43128ea1 ${config.age.secrets.ainstsda1-Virgo-key.path} luks,key-slot=1
      ainstsdc1 UUID=8f97e143-80b8-43a9-904c-248b1173a90d ${config.age.secrets.ainstsdc1-Virgo-key.path} luks,key-slot=1
      gameDrive UUID=7358e6d8-2071-4590-b3e1-dbcb4cf75db2 ${config.age.secrets.GameDrive-Virgo-key.path} luks,key-slot=1
      #ainstnvme2n1p1 UUID=6842e454-1b16-4470-8960-6b50d60443e5 ${config.age.secrets.nvme2n1p1-Virgo-key.path} luks,key-slot=0
    '';
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
