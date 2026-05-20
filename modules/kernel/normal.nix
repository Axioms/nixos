{
  pkgs,
  config,
  lib,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
