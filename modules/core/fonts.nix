{
  config,
  inputs,
  options,
  lib,
  pkgs,
  ...
}:

{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro-nerd
      noto-fonts
      nerd-fonts.jetbrains-mono
    ];
  };
}
