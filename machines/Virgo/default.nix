# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  pkgs,
  system,
  config,
  inputs,
  ...
}:
{
  imports = [
    ./hardware.nix
    ./syncthing.nix
    ../../modules/core
    ../../modules/extra/browsers/firefox.nix
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/extra/looking-glass-client.nix
    ../../modules/extra/libvirt
    ../../modules/kernel/zen.nix
    ../../users/axiom
    ../../modules/core/network-bridge.nix
    ../../modules/extra/docker.nix
    ../../modules/extra/steam.nix
    ../../modules/extra/minecraft.nix
    #inputs.ucodenix.nixosModules.default
  ];
  syncthing.username = "axiom";

  # temp allow flatpacks until streamcontroller is updated
  services.flatpak.enable = true;

  networking.firewall.enable = false;
  network-module.bridge.devices = [ "enp12s0" ];
  hyprland.settings.monitor = ''
    monitor=DP-3, 1920x1080,0x0, 1
    monitor=DP-1, 3840x2160@120.00Hz, 1920x0, 1
    monitor=HDMI-A-1, 3840x2160@60.00Hz, 5760x0, 1
  '';
  networking.hostName = "Virgo"; # Define your hostname.

  #services.ucodenix.enable = true;
  #services.ucodenix.cpuModelId = "00A10F10";
  #hardware.cpu.amd.updateMicrocode = true;
  system.stateVersion = "25.05"; # Did you read the comment?
}
