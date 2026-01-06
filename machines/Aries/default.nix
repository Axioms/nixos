{ config, pkgs, ... }:

{
  nix.settings = {
    download-buffer-size = 524288000; # 500 MiB
  };
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
    ../../modules/core
    ../../modules/extra/browsers/zen.nix
    ../../modules/extra/desktop/apps.nix
    ../../modules/extra/desktop/sddm.nix
    ../../modules/extra/desktop/hyprland
    ../../modules/extra/desktop/plasma
    ../../modules/extra/desktop
    ../../modules/extra/kitty
    ../../modules/extra/smartcard.nix
    ../../modules/extra/development.nix
    ../../modules/kernel/normal.nix
    ../../users/axiom
    ../../modules/extra/docker.nix
    ../../modules/extra/minecraft.nix
    ../../modules/extra/thunderbird
    ];

  networking.hostName = "Aries"; # Define your hostname.
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    });
  '';

  hyprland.settings.monitor = ''
    monitor=, preferred, auto, 1
  '';
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
