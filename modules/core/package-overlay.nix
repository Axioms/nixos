{
  config,
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
    inputs.agenix-rekey.overlays.default

    (final: prev: {
      stable = import inputs.nixpkgs-stable {
        inherit (final) system;
        inherit (final) config;
        allowUnfree = true;
      };

      unstable = import inputs.nixpkgs-unstable {
        inherit (final) system;
        inherit (final) config;
        allowUnfree = true;
      };

      streamdeck = import inputs.nixpkgs-streamcontroller {
        inherit (final) system;
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
    })
  ];
}
