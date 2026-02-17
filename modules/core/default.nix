_:

{

  imports = [
    ./i18n.nix
    ./applications.nix
    ./audio.nix
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
    ./tailscale.nix
  ];

  # Set your time zone.
  time.timeZone = "America/New_York";
  systemd.oomd.enable = false;
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Allow unfree packages

    # Use Beta Cache
    settings.substituters = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];

    # automation
    optimise = {
      automatic = true;
      dates = [ "09:00" ];
    };
  };
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}
