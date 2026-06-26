{
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
      inputs.agenix-rekey.overlays.default

      (final: prev: {
        stable = import inputs.nixpkgs-stable {
          inherit (final.stdenv.hostPlatform) system;
          inherit (final) config;
          allowUnfree = true;
        };

        unstable = import inputs.nixpkgs-unstable {
          inherit (final.stdenv.hostPlatform) system;
          inherit (final) config;
          allowUnfree = true;
        };

        # java 8 flake is broken, use this instead 7/15
        jdk8 = final.openjdk8-bootstrap;
        # cockpit storage module
        udisks2 = prev.udisks2.overrideAttrs (oldAttrs: {
          configureFlags = oldAttrs.configureFlags ++ [
            "--enable-btrfs"
            "--enable-lvm2"
          ];
        });

        openblas = # remove when merged into 26.05 https://nixpk.gs/pr-tracker.html?pr=534770
          if prev.stdenv.hostPlatform.system == "i686-linux" then
            prev.openblas.overrideAttrs (_: {
              doCheck = false;
            })
          else
            prev.openblas;

        usbeehive = pkgs.callPackage ../../pkgs/rust/usbeehive.nix { };
      })
    ];
  };
}
