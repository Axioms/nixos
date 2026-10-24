{
  inputs,
  pkgs,
  ...
}:
let
  kernel = pkgs.cachyosKernels.linux-cachyos-latest.override {
    # Customize CachyOS settings
    lto = "full";
    processorOpt = "zen4";
    bbr3 = true;
  };
in
{
  nix.settings = {
    substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.xinux.uz"
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
    ];
  };
  nixpkgs.overlays = [ inputs.cachyos-kernel.overlays.pinned ];
  boot.kernelPackages = (pkgs.linuxKernel.packagesFor kernel).extend (
    final: prev: {
      zfs_cachyos = pkgs.cachyosKernels.zfs-cachyos.override {
        inherit kernel;
      };
    }
  );
}
