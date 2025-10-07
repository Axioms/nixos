{
  config,
  pkgs,
  inputs,
  self,
  ...
}:
let

  domainTemplate = {
    OVMFFull = (
      pkgs.OVMFFull.override {
        secureBoot = true;
        msVarsTemplate = true;
        httpSupport = false;
        tpmSupport = true;
        tlsSupport = false;
      }
    );

    inherit config pkgs;
  };

  default-network-xml = pkgs.writeText "default-network.xml" (
    import "${self}/modules/extra/libvirt/networks/default.xml.nix" { }
  );
  hostOnly-network-xml = pkgs.writeText "hostonly-network.xml" (
    import "${self}/modules/extra/libvirt/networks/hostonly.xml.nix" { }
  );
  sus-network-xml = pkgs.writeText "sus-network.xml" (
    import "${self}/modules/extra/libvirt/networks/sus.xml.nix" { }
  );
  data-storage-xml = pkgs.writeText "data-storage.xml" (
    import "${self}/modules/extra/libvirt/storage/data.xml.nix" { }
  );
  default-storage-xml = pkgs.writeText "default-storage.xml" (
    import "${self}/modules/extra/libvirt/storage/default.xml.nix" { }
  );
  libvirt-storage-xml = pkgs.writeText "libvirt-storage.xml" (
    import "${self}/modules/extra/libvirt/storage/libvirt.xml.nix" { }
  );
  nvram-storage-xml = pkgs.writeText "nvram-storage.xml" (
    import "${self}/modules/extra/libvirt/storage/nvram.xml.nix" { }
  );
  OS-storage-xml = pkgs.writeText "OS-storage.xml" (
    import "${self}/modules/extra/libvirt/storage/OS.xml.nix" { }
  );
  almalinux9-domain-xml = pkgs.writeText "almalinux9-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/almalinux9.xml.nix" domainTemplate
  );
  archlinux-domain-xml = pkgs.writeText "archlinux-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/archlinux.xml.nix" domainTemplate
  );
  fedora-domain-xml = pkgs.writeText "fedora-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/fedora.xml.nix" domainTemplate
  );
  hackTheBox-domain-xml = pkgs.writeText "hackTheBox-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/hackTheBox.xml.nix" domainTemplate
  );
  kali-domain-xml = pkgs.writeText "kali-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/kali.xml.nix" domainTemplate
  );
  nixos-domain-xml = pkgs.writeText "nixos-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/nixos.xml.nix" domainTemplate
  );
  windows-10-glass-domain-xml = pkgs.writeText "windows-10-glass-domain.xml" (
    import "${self}/modules/extra/libvirt/domains/windows-10-glass.xml.nix" domainTemplate
  );
in
{

  disabledModules = [ "virtualisation/libvirtd.nix" ];

  boot.extraModprobeConfig = "options kvm_amd nested=1";
  imports = [
    inputs.nixvirt.nixosModules.default
    "${inputs.nixpkgs-unstable}/nixos/modules/virtualisation/libvirtd.nix"
  ];
  programs.virt-manager = {
    enable = true;
  };
  virtualisation.libvirt.package = pkgs.unstable.libvirt;
  virtualisation.libvirt.enable = true;
  virtualisation.libvirt.swtpm.enable = true;
  virtualisation.libvirt.connections."qemu:///system".networks = [
    {
      definition = default-network-xml;
      active = true;
      restart = true;
    }
    {
      definition = hostOnly-network-xml;
      active = true;
      restart = true;
    }
    {
      definition = sus-network-xml;
      active = true;
      restart = true;
    }
  ];

  virtualisation.libvirt.connections."qemu:///system".pools = [
    {
      definition = data-storage-xml;
      active = true;
      restart = true;
    }
    {
      definition = default-storage-xml;
      active = true;
      restart = true;
    }
    {
      definition = libvirt-storage-xml;
      active = true;
      restart = true;
    }
    {
      definition = nvram-storage-xml;
      active = true;
      restart = true;
    }
    {
      definition = OS-storage-xml;
      active = true;
      restart = true;
    }
  ];

  virtualisation.libvirt.connections."qemu:///system".domains = [
    {
      definition = almalinux9-domain-xml;
      active = false;
      restart = true;
    }
    {
      definition = archlinux-domain-xml;
      active = false;
      restart = false;
    }
    {
      definition = fedora-domain-xml;
      active = false;
      restart = false;
    }
    {
      definition = hackTheBox-domain-xml;
      active = false;
      restart = false;
    }
    {
      definition = kali-domain-xml;
      active = false;
      restart = false;
    }
    {
      definition = nixos-domain-xml;
      active = true;
      restart = false;
    }
    #{
    #  definition = windows-10-glass-domain-xml;
    #  active = false;
    #  restart = false;
    #}
  ];
  virtualisation.libvirt.verbose = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.unstable.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.unstable.OVMFFull.override {
            secureBoot = true;
            msVarsTemplate = true;
            httpSupport = true;
            tpmSupport = true;
            tlsSupport = true;
          }).fd
        ];
      };
    };

  };

  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };

    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  users.users.axiom = {
    extraGroups = [ "libvirtd" ];
  };
  #nvram = [
  #  "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd"
  #  "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd"
  #];

}
