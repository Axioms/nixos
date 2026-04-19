{
  pkgs,
  config,
  lib,
  ...
}:

{
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
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
