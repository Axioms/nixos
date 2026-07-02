{
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs = {
    config = {
      allowBroken = false;
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

        jellyfin-desktop = prev.jellyfin-desktop.overrideAttrs (oldAttrs: {
          # TODO: remove once jellydin desktop v3 is released
          configureFlags = oldAttrs.qtWrapperArgs ++ [
            "--set-default QTWEBENGINE_FORCE_USE_GBM 0"
          ];
        });

        pnpm_10_29_2 = final.pnpm_10; # TODO: remove after 8/26

        usbeehive = pkgs.callPackage ../../pkgs/rust/usbeehive.nix { };
      })
    ];
  };
}
