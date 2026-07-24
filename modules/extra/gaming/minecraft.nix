{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    prismlauncher
    inputs.hytale.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
