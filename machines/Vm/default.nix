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
  disabledModules = [ "hardware/cpu/amd-microcode.nix" ];

  imports = [
    ./hardware-configuration.nix
    ../Virgo/syncthing.nix
    ../../modules/core
    ../../modules/extra/browsers/firefox.nix
    ../../modules/extra/looking-glass-client.nix
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/extra/libvirt
    ../../modules/kernel/zen.nix
    ../../users/axiom
    ../../modules/core/network-bridge.nix
    ../../modules/extra/docker.nix
    inputs.ucodenix.nixosModules.default
    # hardware.cpu.amd.microcodePackage not supported by nix stable
    "${inputs.nixpkgs-unstable}/nixos/modules/hardware/cpu/amd-microcode.nix"

  ];

  # Qemu guest shit
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true; # enable copy and paste between host and guest
  syncthing.username = "axiom";
  network-module.bridge.devices = [ "enp1s0" ];
  hyprland.settings.monitor = ''
    monitor=Virtual-1, 1920x1080, 0x0, 1
  '';
  networking.hostName = "vm"; # Define your hostname.

  services.ucodenix.enable = true;
  services.ucodenix.cpuModelId = "00A10F10";
  hardware.cpu.amd.updateMicrocode = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
