{
  inputs,
  pkgs,
  ...
}:

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
  #TODO: remove extend once ddcci driver is fixed
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest.extend (
    _final: prev: {
      ddcci-driver = prev.ddcci-driver.overrideAttrs (oldAttrs: {
        patches = [
          (pkgs.fetchpatch {
            name = "Use-sysfs_emit-and-field-width-specifier.patch";
            url = "https://gitlab.com/liquidnya/ddcci-driver-linux/-/commit/9510aa4aebf32678884f55ae251e54012a354ed1.patch";
            hash = "sha256-s12ers7nPFaHOB+8/S8t3dtdoR6slukkfNPdghgftNs=";
          })
        ]
        ++ (oldAttrs.patches or [ ]);
      });
    }
  );
}
