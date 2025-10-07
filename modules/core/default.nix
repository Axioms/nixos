{ config, pkgs, ... }:

{

  imports = [
    ./i18n.nix
    ./applications.nix
    ./env.nix
    ./fastfetch.nix
    ./fonts.nix
    ./networking.nix
    ./nvim.nix
    ./package-overlay.nix
    ./printer.nix
    ./secureboot.nix
    ./zsh
    ./age/age.nix
    ./ssh.nix
    ./home-manager.nix
    ./cockpit.nix
  ];

  # Set your time zone.
  time.timeZone = "America/New_York";
  systemd.oomd.enable = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # automation
  nix.optimise = {
    automatic = true;
    dates = [ "09:00" ];
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}
