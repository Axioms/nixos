{ lib, config, ... }:
# TODO: Add Config variables for Username AdminUsername TimeZone
{

  imports = [
    ./i18n.nix
    ./applications.nix
    ./audio.nix
    ./env.nix
    ./fastfetch.nix
    ./fonts.nix
    ./networking.nix
    ./nvim
    ./package-overlay.nix
    ./printer.nix
    ./secureboot.nix
    ./zsh
    ./age/age.nix
    ./ssh.nix
    ./home-manager.nix
    ./cockpit.nix
    ./tailscale.nix
  ];

  options = {
    TimeZone = lib.mkOption {
      default = "America/New_York";
      type = lib.types.str;
    };
  };
  config = {

    # Set your time zone.
    time.timeZone = config.TimeZone;
    systemd.oomd.enable = false;
    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        # Allow unfree packages

        # Use Beta Cache
        substituters = [
          "https://aseipp-nix-cache.global.ssl.fastly.net"
          "https://nix-community.cachix.org"
        ];

        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
      # automation
      optimise = {
        automatic = true;
        dates = [ "09:00" ];
      };
      gc = {
        automatic = true;
        randomizedDelaySec = "14m";
        options = "--delete-older-than 30d";
      };
    };

    services.fstrim = {
      enable = true;
      interval = "weekly";
    };

    boot.loader.systemd-boot.configurationLimit = 10;
  };
}
