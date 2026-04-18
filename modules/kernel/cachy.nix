{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  nix.settings = {
    substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
  nixpkgs.overlays = [ inputs.cachyos-kernel.overlays.pinned ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  # TODO Remove when linuz 7.0 is on nix?
  boot.initrd.luks.cryptoModules =
    let
      isModern = lib.versionAtLeast config.boot.kernelPackages.kernel.version "7.0";
    in
    lib.mkForce (
      if isModern then
        [
          "aes"
          "xts"
          "sha256"
        ]
      else
        [
          "aes"
          "aes_generic"
          "xts"
          "sha256"
        ]
    );
}
